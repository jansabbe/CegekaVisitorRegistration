//
//  CegekaVisitorRegistrationTests.m
//  CegekaVisitorRegistrationTests
//
//  Created by Jan Sabbe on 18/06/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import "CegekaVisitorRegistrationTests.h"
#import "CGKVisitor.h"

@implementation CegekaVisitorRegistrationTests

@synthesize testingContext;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString* path = [bundle pathForResource:@"CGKVisitors" ofType:@"momd"];
    NSURL *momURL = [NSURL URLWithString:path];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:momURL];
    NSPersistentStoreCoordinator *coord = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: model];
    [coord addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:nil];
    testingContext = [[NSManagedObjectContext alloc] init];
    [testingContext setPersistentStoreCoordinator: coord];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testStoringAVisitor
{
    CGKVisitor* visitor = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    visitor.firstName = @"Name";
    NSError* error = nil;
    [self.testingContext save:&error];
    STAssertNil(error, @"Error shouldn't occur while saving: %@", error);

    CGKVisitor* foundVisitor = (CGKVisitor*)[self.testingContext existingObjectWithID:visitor.objectID error:&error];
    
    STAssertNil(error, @"Error shouldn't occur while saving: %@", error);
    STAssertEqualObjects(visitor, foundVisitor, nil);
}

- (void)testSearchingAVisitor
{
    CGKVisitor* visitor1 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    visitor1.firstName = @"Name";
    CGKVisitor* visitor2 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    visitor2.firstName = @"Name2";
    [self.testingContext save:nil];
    
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:[CGKVisitor entityName]];
    request.predicate = [NSPredicate predicateWithFormat:@"firstName = %@", @"Name2"];
    
    NSArray* result = [self.testingContext executeFetchRequest:request error:nil];
    STAssertEquals([result count], 1u, nil);
    STAssertEqualObjects(result[0], visitor2, nil);
}

- (void)testExportAllVisitors
{
    CGKVisitor* visitor1 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    visitor1.sentToAdminValue = YES;
    CGKVisitor* visitor2 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    CGKVisitor* visitor3 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    
    [self.testingContext save:nil];
    
    NSArray* result =[CGKVisitor visitorsSince:NO inManagedObjectContext:self.testingContext];
    NSArray* expected = @[visitor1,visitor2,visitor3];
    STAssertEqualObjects(expected, result, nil);
    
}

- (void)testExportNonExportedVisitors
{
    CGKVisitor* visitor1 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    visitor1.sentToAdminValue = YES;
    CGKVisitor* visitor2 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    CGKVisitor* visitor3 = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    
    [self.testingContext save:nil];
    
    NSArray* result =[CGKVisitor visitorsSince:YES inManagedObjectContext:self.testingContext];
    NSArray* expected = @[visitor2,visitor3];
    STAssertEqualObjects(expected, result, nil);
    
}

- (void) testCanExportToCsv
{
    CGKVisitor* visitor = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    visitor.visitDate = [NSDate dateWithTimeIntervalSince1970:10];
    visitor.firstName = @"First Name";
    visitor.lastName = @"Last Name";
    visitor.email = @"bla@sjoko.be";
    visitor.licensePlate = @"23923";
    visitor.visiting = @"Someone";
    NSString* result = [visitor descriptionForCSV];
    NSString* expected = @"1970-01-01 00:00:10 +0000,First Name,Last Name,bla@sjoko.be,23923,Someone";
    STAssertEqualObjects(expected, result, nil);
    
}

- (void) testCanExportToCsvWithNils
{
    CGKVisitor* visitor = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    visitor.visitDate = [NSDate dateWithTimeIntervalSince1970:10];
    NSString* result = [visitor descriptionForCSV];
    NSString* expected = @"1970-01-01 00:00:10 +0000,,,,,";
    STAssertEqualObjects(expected, result, nil);
    
}

- (void) testCanExportToCsvIncludingCommasAndNewLines
{
    CGKVisitor* visitor = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    visitor.visitDate = [NSDate dateWithTimeIntervalSince1970:10];
    visitor.firstName = @"first,name";
    visitor.lastName = @"last\nname";
    NSString* result = [visitor descriptionForCSV];
    NSString* expected = @"1970-01-01 00:00:10 +0000,\"first,name\",\"last\nname\",,,";
    STAssertEqualObjects(expected, result, nil);
}

- (void) testCanExportToCsvIncludingDoubleQuotes
{
    CGKVisitor* visitor = [CGKVisitor insertInManagedObjectContext:self.testingContext];
    visitor.visitDate = [NSDate dateWithTimeIntervalSince1970:10];
    visitor.firstName = @"first\"name\" man";
    NSString* result = [visitor descriptionForCSV];
    NSString* expected = @"1970-01-01 00:00:10 +0000,\"first\"\"name\"\" man\",,,,";
    STAssertEqualObjects(expected, result, nil);
}

@end
