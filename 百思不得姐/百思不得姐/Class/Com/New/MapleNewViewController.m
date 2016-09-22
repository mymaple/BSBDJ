//
//  MapleNewViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/21.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleNewViewController.h"

@interface MapleNewViewController ()

@end

@implementation MapleNewViewController

- (void)configView {
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    [self setLeftBarButtonItemWithImage:@"MainTagSubIcon"
                              imageHigh:@"MainTagSubIconClick"
                                 action:@selector(leftClick:)];
    
    
}

- (void)leftClick:(UIButton*)btn {
    DebugLog(@"");
}
@end
