#import "CGKVisitor.h"


@interface CGKVisitor ()

// Private interface goes here.

@end


@implementation CGKVisitor

// Custom logic goes here.

+ (NSArray *)visitorsSince:(BOOL)lastExport inManagedObjectContext:(NSManagedObjectContext*)moc{
    
    // Create the fetch request for the entity.
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
//    NSEntityDescription *entity = 
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CGKVisitor" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    //add a predicate if necessary
    if (lastExport) {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"sentToAdmin == %@", [NSNumber numberWithBool: NO]];
        fetchRequest.predicate = searchPredicate;
    }
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"visitDate" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];

    NSError *error;
    NSArray *result = [moc executeFetchRequest:fetchRequest error:&error];
    return result;
}

- (NSString *)descriptionForCSV{
    return [ @[self.visitDate, self.firstName, self.lastName, self.email, self.licensePlate, self.visiting] componentsJoinedByString:@", "];
    
}

- (void)awakeFromInsert{
    [super awakeFromInsert];
    [self setSentToAdminValue:NO];
    [self setVisitDate:[NSDate date]];
}

@end
