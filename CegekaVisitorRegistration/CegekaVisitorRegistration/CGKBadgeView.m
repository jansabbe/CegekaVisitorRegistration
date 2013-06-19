//
//  CGKBadgeView.m
//  CegekaVisitorRegistration
//
//  Created by Frank on 6/19/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import "CGKBadgeView.h"

#define FONT_SIZE_EXTRA_LARGE 48
#define FONT_SIZE_LARGE 30
#define FONT_SIZE_NORMAL 16
#define FONT_SIZE_SMALL 16
#define INSET 2
#define DIVISOR_LINE 228

#define BADGE_WIDTH 500
#define BADGE_HEIGHT 330
#define BADGE_OPACITY YES
#define BADGE_SCALE 1.0

#define LOGO_WIDTH 132.3
#define LOGO_HEIGHT 144.6

@implementation CGKBadgeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    [self drawBadgeInContext:UIGraphicsGetCurrentContext()];
}

- (void) drawBadgeInContext:(CGContextRef)ctx {
    CGContextSetRGBFillColor( ctx, 1, 1, 1, 1);
    CGContextFillRect(ctx, CGRectMake(self.bounds.origin.x,
                                      self.bounds.origin.y,
                                      BADGE_WIDTH,
                                      BADGE_HEIGHT));
    
    
    CGContextSetRGBFillColor( ctx, 0, 0, 0, 1);    
    CGContextSaveGState(ctx);
    CGContextTranslateCTM(ctx, 0.0f, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0f, -1.0f);
    
    UIImage *logo = [UIImage imageNamed:@"CGK_logo.png"];
    
    CGContextDrawImage (ctx, CGRectMake(0, self.bounds.size.height - LOGO_HEIGHT, LOGO_WIDTH, LOGO_HEIGHT), logo.CGImage);
    CGContextSetTextDrawingMode(ctx, kCGTextFill);
    
    CGSize size;
    
    //
    
    // Draw a line
    //Start at this point
    CGContextMoveToPoint(ctx, 0, DIVISOR_LINE);
    
    //Give instructions to the CGContext
    //(move "pen" around the screen)
    CGContextAddLineToPoint(ctx, BADGE_WIDTH, DIVISOR_LINE);
    
    
    //Draw it
    CGContextStrokePath(ctx);
    //
    
    float offSetX = LOGO_WIDTH + (BADGE_WIDTH - LOGO_WIDTH)/2;
    float offSetY = DIVISOR_LINE;

    // first name
    size = [self.firstName sizeWithFont:[UIFont fontWithName:@"Helvetica" size:FONT_SIZE_EXTRA_LARGE]];
    offSetX = offSetX - size.width/2;
    
    CGContextSelectFont(ctx, "Helvetica", FONT_SIZE_EXTRA_LARGE, kCGEncodingMacRoman);
    CGContextSetTextPosition(ctx, offSetX, offSetY + INSET);
    CGContextShowText(ctx, [[self.firstName uppercaseString] UTF8String], [self.firstName length]);
    
    // last name
    size = [self.lastName sizeWithFont:[UIFont fontWithName:@"Helvetica" size:FONT_SIZE_LARGE]];
    offSetX = offSetX - size.width/2;
    
    CGContextSelectFont(ctx, "Helvetica", FONT_SIZE_LARGE, kCGEncodingMacRoman);
    CGContextSetTextPosition(ctx, offSetX, offSetY - 30 * INSET);
    CGContextShowText(ctx, [[self.lastName uppercaseString] UTF8String], [self.lastName length]);
    
    CGContextSetRGBFillColor( ctx, 0.6, 0.6, 0.6, 1);
    
    // visiting
    CGContextSelectFont(ctx, "Helvetica", FONT_SIZE_SMALL, kCGEncodingMacRoman);
    CGContextSetTextPosition(ctx, 0.0f, 2 * (FONT_SIZE_SMALL + INSET));
    CGContextShowText(ctx, [self.visiting UTF8String], [self.visiting length]);
    
    // date
    CGContextSelectFont(ctx, "Helvetica", FONT_SIZE_SMALL, kCGEncodingMacRoman);
    CGContextSetTextPosition(ctx, 0, FONT_SIZE_SMALL + INSET);
    NSDate *now = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    
    CGContextShowText(ctx, [[formatter stringFromDate:now] UTF8String], [[formatter stringFromDate:now] length]);

    CGContextRestoreGState(ctx);
}

- (UIImage *) getBadgeImage {
    
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(BADGE_WIDTH, BADGE_HEIGHT), BADGE_OPACITY, BADGE_SCALE);
    CGContextRef context = UIGraphicsGetCurrentContext();

    [self drawBadgeInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
