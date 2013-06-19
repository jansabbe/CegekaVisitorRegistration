#import "CGKVisitor.h"


@interface CGKVisitor ()

// Private interface goes here.

@end


@implementation CGKVisitor

// Custom logic goes here.

+ (NSArray *)visitorsSince:(BOOL)lastExport inManagedObjectContext:(NSManagedObjectContext*)moc{
    // Create the fetch request for the entity.
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[CGKVisitor entityName]];
    
    //add a predicate if necessary
    if (lastExport) {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"sentToAdmin == %@", [NSNumber numberWithBool: NO]];
        fetchRequest.predicate = searchPredicate;
    }
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"visitDate" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    

    NSError *error;
    NSArray *result = [moc executeFetchRequest:fetchRequest error:&error];
    NSAssert(!error, @"Error occured: %@", error);
    return result;
}

- (NSString *)descriptionForCSV{
    ;
    return [ @[self.visitDate,
                [self csvEscape: self.firstName],
                [self csvEscape: self.lastName],
                [self csvEscape: self.email],
                [self csvEscape: self.licensePlate],
                [self csvEscape: self.visiting]
            ] componentsJoinedByString:@","];
    
}

- (void)awakeFromInsert{
    [super awakeFromInsert];
    [self setSentToAdminValue:NO];
    [self setVisitDate:[NSDate date]];
}

- (NSString*) csvEscape:(NSString*) value
{
    if (!value) {
        return @"";
    }
    NSCharacterSet *reservedCharsInCsv = [NSCharacterSet characterSetWithCharactersInString:@",\"\n"];
    if ([value rangeOfCharacterFromSet:reservedCharsInCsv].location != NSNotFound) {
        value = [value stringByReplacingOccurrencesOfString:@"\"" withString:@"\"\""];
        value = [NSString stringWithFormat:@"\"%@\"", value];
    }
    
    return value;
}

@end
