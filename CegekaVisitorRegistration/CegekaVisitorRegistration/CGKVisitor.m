#import "CGKVisitor.h"


@interface CGKVisitor ()

// Private interface goes here.

@end


@implementation CGKVisitor

// Custom logic goes here.

- (void)awakeFromInsert{
    [super awakeFromInsert];
    [self setSentToAdminValue:NO];
    [self setVisitDate:[NSDate date]];
}

@end
