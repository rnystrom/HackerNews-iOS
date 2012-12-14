//
//  RNBaseViewController.m
//  HackerNews
//
//  Created by Ryan Nystrom on 12/13/12.
//  Copyright (c) 2012 Ryan Nystrom. All rights reserved.
//

#import "RNBaseViewController.h"
#import "RNPlaneView.h"

@interface RNBaseViewController ()

@end

@implementation RNBaseViewController {
    RNPlaneView *_plane;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.882 green:0.278 blue:0.192 alpha:1.000];
    
    _plane = [[RNPlaneView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.view addSubview:_plane];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _plane.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
