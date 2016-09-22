//
//  MapleTabBarController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/21.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleTabBarController.h"


#import "MapleMeViewController.h"
#import "MapleNewViewController.h"
#import "MapleEssenceViewController.h"
#import "MapleFriendTrendsViewController.h"
#import "MaplePublishTabBar.h"
#import "MapleNavigationController.h"

@interface MapleTabBarController ()

@end

@implementation MapleTabBarController

//一次性设置
+ (void)initialize {
    //通过appearance统一设置 文字属性 带有UI_APPEARANCE_SELECTOR
    //工具栏全局设置
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    //正常文字设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    //选中文字设置
    NSMutableDictionary *attrsSelected = [NSMutableDictionary dictionary];
    attrsSelected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrsSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:attrsSelected forState:UIControlStateSelected];
    
    //导航栏背景图全局设置 ,设置使用范围
    [[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[MapleNavigationController class]]] setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)configView {

    
    
    [self addChildViewController:[[MapleEssenceViewController alloc]init]
                     titleDidSet:@"精华"
                           image:@"tabBar_essence_icon"
                   imageOriginal:@"tabBar_essence_click_icon"];
    
    
    [self addChildViewController:[[MapleNewViewController alloc]init]
                     titleDidSet:@"新帖"
                           image:@"tabBar_new_icon"
                   imageOriginal:@"tabBar_new_click_icon"];
    
    
    [self addChildViewController:[[MapleFriendTrendsViewController alloc]init]
                     titleDidSet:@"关注"
                           image:@"tabBar_friendTrends_icon"
                   imageOriginal:@"tabBar_friendTrends_click_icon"];
    
    
    [self addChildViewController:[[MapleMeViewController alloc]init]
                     titleDidSet:@"我"
                           image:@"tabBar_me_icon"
                   imageOriginal:@"tabBar_me_click_icon"];
    
    [self setValue:[[MaplePublishTabBar alloc]init] forKeyPath:@"tabBar"];
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    
}

@end
