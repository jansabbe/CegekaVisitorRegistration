//
//  CGKExportViewControllerTest.m
//  CegekaVisitorRegistration
//
//  Created by Jan Sabbe on 19/06/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import "CGKExportViewControllerTest.h"
#import "CGKTestCoreData.h"
#import "CGKVisitor.h"
#import "CGKExportViewController.h"

@interface CGKExportViewControllerTest()
@property (strong, nonatomic) NSManagedObjectContext* testingContext;

@property (strong, nonatomic) CGKExportViewController* exportController;

@end

@implementation CGKExportViewControllerTest

- (void)setUp
{
    [super setUp];
    self.testingContext = [CGKTestCoreData testingContext];
    self.exportController = [[CGKExportViewController alloc] init];
    self.exportController.managedObjectContext = self.testingContext;
}

- (void) testAfterSendingMailVisitorsAreMarkedAsSent
{
    CGKVisitor* visitor1 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    CGKVisitor* visitor2 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    CGKVisitor* visitor3 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    [self.testingContext save:nil];
    
    [self.exportController mailComposeController:nil didFinishWithResult:MFMailComposeResultSent error:nil];
    
    STAssertTrue(visitor1.sentToAdminValue, nil);
    STAssertTrue(visitor2.sentToAdminValue, nil);
    STAssertTrue(visitor3.sentToAdminValue, nil);
}

- (void) testCancellingMailDoesntMarkVisitorsAsSent
{
    CGKVisitor* visitor1 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    CGKVisitor* visitor2 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    CGKVisitor* visitor3 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    [self.testingContext save:nil];
    
    [self.exportController mailComposeController:nil didFinishWithResult:MFMailComposeResultCancelled error:nil];
    
    STAssertFalse(visitor1.sentToAdminValue, nil);
    STAssertFalse(visitor2.sentToAdminValue, nil);
    STAssertFalse(visitor3.sentToAdminValue, nil);
}

-(void) testCanCreateCsvFile
{
    CGKVisitor* visitor1 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    CGKVisitor* visitor2 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    NSError* error;
    [self.testingContext save:&error];
    STAssertNil(error, nil);
    
    //Calling private method for testing
    NSData* data = [self.exportController performSelector:@selector(visitorCsvAttachmentWithOnlyUnsentVisitors:) withObject:[NSNumber numberWithBool:YES]];
    
    NSString* actualCsv = [NSString stringWithUTF8String:[data bytes]];

    NSString* expectedCsv = [NSString stringWithFormat:@"%@\n%@\n", [visitor1 descriptionForCSV], [visitor2 descriptionForCSV] ];
    NSLog(@"Actual: \nSTART\n%@\nEND\n", actualCsv);
    NSLog(@"Expected: \nSTART\n%@\nEND\n", expectedCsv);
    STAssertEqualObjects(actualCsv, expectedCsv, nil);
}

-(void) testDoesNotCreateCsvFileWhenNoNewVisitors
{
    CGKVisitor* visitor1 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    visitor1.sentToAdminValue = YES;
    CGKVisitor* visitor2 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    visitor2.sentToAdminValue = YES;

    NSError* error;
    [self.testingContext save:&error];
    STAssertNil(error, nil);
    
    //Calling private method for testing
    NSData* data = [self.exportController performSelector:@selector(visitorCsvAttachmentWithOnlyUnsentVisitors:) withObject:[NSNumber numberWithBool:YES]];
    STAssertNil(data, nil);
}

@end
