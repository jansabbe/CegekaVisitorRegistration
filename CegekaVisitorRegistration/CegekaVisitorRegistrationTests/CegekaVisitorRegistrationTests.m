//
//  CegekaVisitorRegistrationTests.m
//  CegekaVisitorRegistrationTests
//
//  Created by Jan Sabbe on 18/06/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import "CegekaVisitorRegistrationTests.h"

@implementation CegekaVisitorRegistrationTests

@synthesize testingContext;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(@"CGKVisitor")];
    NSString* path = [bundle pathForResource:@"CGKVisitors" ofType:@"momd"];
    NSURL *momURL = [NSURL URLWithString:path];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:momURL];
    NSPersistentStoreCoordinator *coord = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: model];
    NSPersistentStore *store = [coord addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:nil];
    testingContext = [[NSManagedObjectContext alloc] init];
    [testingContext setPersistentStoreCoordinator: coord];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    STFail(@"Unit tests are not implemented yet in CegekaVisitorRegistrationTests");
}

@end
