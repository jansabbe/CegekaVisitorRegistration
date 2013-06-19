//
//  CGKBadgeView.m
//  CegekaVisitorRegistration
//
//  Created by Frank on 6/19/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import "CGKBadgeView.h"

#define FONT_SIZE 12

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
    CGContextSetRGBFillColor( ctx, 0, 0, 255, 1 );
    //CGContextFillRect( ctx, rect);
    
    //CGContextSetStrokeColorWithColor(ctx, (__bridge CGColorRef)([UIColor redColor]));
    //CGContextSetFillColorWithColor(ctx, (__bridge CGColorRef)([UIColor greenColor]));
    
    CGContextSaveGState(ctx);
    CGContextTranslateCTM(ctx, 0.0f, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0f, -1.0f);
    
    //CGColorRef textColor = CGColorRetain([[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0] CGColor]);
    
    CGContextSelectFont(ctx, "Helvetica", FONT_SIZE, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(ctx, kCGTextFill);
    
    CGContextSetTextPosition(ctx, 0.0f, 40);
    CGContextShowText(ctx, [self.firstName UTF8String], [self.firstName length]);
    
    CGContextSetTextPosition(ctx, 0.0f, 20);
    CGContextShowText(ctx, [self.lastName UTF8String], [self.lastName length]);
    
    CGContextSetTextPosition(ctx, 0.0f, 0);
    CGContextShowText(ctx, [self.visiting UTF8String], [self.visiting length]);
    
    CGContextRestoreGState(ctx);
}

- (UIImage *) getBadgeImage {
    
    
//    UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
//    2) get the context
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    3) draw whatever you need
//    
//    4) export the context into an image
//    
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    5) destroy the context
//    
//    UIGraphicsEndImageContext();
//    6) store the reference to the image
//    
//    [yourArray addObject:image];
    
    return nil;
}

@end
