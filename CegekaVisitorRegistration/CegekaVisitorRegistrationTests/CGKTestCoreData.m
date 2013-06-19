//
//  CGKTestCoreData.m
//  CegekaVisitorRegistration
//
//  Created by Jan Sabbe on 19/06/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import "CGKTestCoreData.h"

@implementation CGKTestCoreData

+ (NSManagedObjectContext*) testingContext {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString* path = [bundle pathForResource:@"CGKVisitors" ofType:@"momd"];
    NSURL *momURL = [NSURL URLWithString:path];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:momURL];
    NSPersistentStoreCoordinator *coord = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: model];
    [coord addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:nil];
    NSManagedObjectContext* testingContext = [[NSManagedObjectContext alloc] init];
    [testingContext setPersistentStoreCoordinator: coord];
    return testingContext;
}

@end
