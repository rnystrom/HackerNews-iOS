//
//  RNPlaneView.m
//  HackerNews
//
//  Created by Ryan Nystrom on 12/14/12.
//  Copyright (c) 2012 Ryan Nystrom. All rights reserved.
//

#import "RNPlaneView.h"
#import <QuartzCore/QuartzCore.h>

static CGPoint kRNPlaneLeftPath[] = {
    {6.5f, 16},    // center of tail
    {2, 17},
    {2, 15},
    {5, 13},
    {5, 11},
    {0, 12},    // left wing bottom
    {0, 10},
    {5, 7},
    {5, 2},      // begin bez path
    {6.5f, 0}   // halfway point of bez
};

static CGSize kRNPlaneSize = {6.5f, 17.f};

@implementation RNPlaneView

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _init];
    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self _init];
    }
    return self;
}

- (void)_init {
    self.clipsToBounds = NO;
    self.layer.masksToBounds = NO;
    
    self.borderColor = [UIColor blackColor];
    self.fillColor = [UIColor darkGrayColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect {
    // default colors
    CGColorRef backgroundColor = self.backgroundColor.CGColor;
    CGColorRef borderColor = self.borderColor.CGColor;
    CGColorRef fillColor = self.fillColor.CGColor;
    
    // calculate our plane's scale
    CGFloat scale = 1.f;
    if (self.frame.size.height > self.frame.size.width) {
        scale = self.frame.size.width / kRNPlaneSize.width;
    }
    else {
        scale = self.frame.size.height / kRNPlaneSize.height;
    }
    
    int pointsCount = sizeof(kRNPlaneLeftPath) / sizeof(kRNPlaneLeftPath[0]);
    
    // build our path
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < pointsCount; i++) {
        CGPoint point = kRNPlaneLeftPath[i];
        if (i == 0) {
            [path moveToPoint:point];
        }
        else {
            [path addLineToPoint:point];
        }
    }
    [path closePath];
    
    // scale to view's size
    [path applyTransform:CGAffineTransformMakeScale(scale, scale)];
    
    // colorize
    [self.fillColor setFill];
    [path fill];
    [self.borderColor setStroke];
    path.lineWidth = 1;
    [path stroke];
    
    // release refs
    CGColorRelease(backgroundColor);
    CGColorRelease(borderColor);
    CGColorRelease(fillColor);
}

#pragma mark - Setters

- (void)setFillColor:(UIColor *)fillColor {
    if (_fillColor != fillColor) {
        _fillColor = fillColor;
        [self setNeedsDisplay];
    }
}

- (void)setPercentComplete:(NSInteger)percentComplete {
    if (_percentComplete != percentComplete) {
        _percentComplete = percentComplete;
        [self setNeedsDisplay];
    }
}

- (void)setBorderColor:(UIColor *)borderColor {
    if (_borderColor != borderColor) {
        _borderColor = borderColor;
        [self setNeedsDisplay];
    }
}

- (void)setCompleteColor:(UIColor *)completeColor {
    if (_completeColor != completeColor) {
        _completeColor = completeColor;
        [self setNeedsDisplay];
    }
}

@end
