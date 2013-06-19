#import "_CGKVisitor.h"

@interface CGKVisitor : _CGKVisitor {}
// Custom logic goes here.

+ (NSArray *)visitorsSince:(BOOL)lastExport inManagedObjectContext:(NSManagedObjectContext*)moc;

- (NSString *)descriptionForCSV;

@end
