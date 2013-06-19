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


- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor( ctx, 0, 0, 255, 1 );
    CGContextFillRect( ctx, rect);

//    CGContextSetStrokeColorWithColor(ctx, (__bridge CGColorRef)([UIColor redColor]));
//    CGContextSetFillColorWithColor(ctx, (__bridge CGColorRef)([UIColor greenColor]));
//    
//    CGContextSelectFont(ctx, "Helvetica", FONT_SIZE, kCGEncodingMacRoman);
//    CGContextSetTextDrawingMode(ctx, kCGTextFill);
//    CGContextSetTextPosition(ctx, 0.0f, round(FONT_SIZE / 4.0f));
//    CGContextShowText(ctx, [@"abc123" UTF8String], strlen([@"abc123" UTF8String]));
}

@end
