//
//  MapleMeViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/21.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleMeViewController.h"
#import "MapleBarButtonItem.h"

@interface MapleMeViewController ()

@end

@implementation MapleMeViewController

- (void)configView {
    self.navigationItem.title = @"我的";
    
    MapleBarButtonItem *rightBtn1 =
    [MapleBarButtonItem barButtonItemWithImage:@"mine-setting-icon"
                                     imageHigh:@"mine-setting-icon-click"
                                        target:self
                                        action:@selector(rightClick1:)];
    MapleBarButtonItem *rightBtn2 =
    [MapleBarButtonItem barButtonItemWithImage:@"mine-moon-icon"
                                     imageHigh:@"mine-moon-icon-click"
                                        target:self
                                        action:@selector(rightClick2:)];
    
    self.navigationItem.rightBarButtonItems =@[rightBtn1, rightBtn2];

    
    
}

- (void)rightClick1:(UIButton*)btn {
    DebugLog(@"");
}

- (void)rightClick2:(UIButton*)btn {
    DebugLog(@"");
}

@end
