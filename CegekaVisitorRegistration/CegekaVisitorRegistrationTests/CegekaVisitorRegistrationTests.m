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

@end
