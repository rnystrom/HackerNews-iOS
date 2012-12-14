//
//  RNPlaneView.h
//  HackerNews
//
//  Created by Ryan Nystrom on 12/14/12.
//  Copyright (c) 2012 Ryan Nystrom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RNPlaneView : UIView

// Should be an integer between 0 and 100
@property (assign, nonatomic) NSInteger percentComplete;
@property (strong, nonatomic) UIColor *fillColor;
@property (strong, nonatomic) UIColor *borderColor;
@property (strong, nonatomic) UIColor *completeColor;

@end
