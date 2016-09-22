//
//  MapleFriendTrendsViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/21.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleFriendTrendsViewController.h"

@interface MapleFriendTrendsViewController ()

@end

@implementation MapleFriendTrendsViewController

- (void)configView {
    self.navigationItem.title = @"我的关注";
    [self setLeftBarButtonItemWithImage:@"friendsRecommentIcon"
                              imageHigh:@"friendsRecommentIcon-click"
                                 action:@selector(leftClick:)];
    
    
}

- (void)leftClick:(UIButton*)btn {
    DebugLog(@"");
}

@end
