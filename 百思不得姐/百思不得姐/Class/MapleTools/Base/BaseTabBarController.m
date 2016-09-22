//
//  BaseTabBarController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/20.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "BaseTabBarController.h"

#import "MapleNavigationController.h"


@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = BACKGROUND_COLOR;
    [self configView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)configView {
    
}


/**
 *  子控制器配置
 */
- (void)addChildViewController:(UIViewController *)childController
                         title:(NSString*)title
                         image:(NSString*)image
                 imageSelected:(NSString*)imageSelected
{
    UITabBarItem *item = [[UITabBarItem alloc]init];

    item.image = [UIImage imageNamed:image];
    //图片去渲染
    item.selectedImage = [[UIImage imageNamed:imageSelected]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item.title = title;
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

    childController.tabBarItem = item;
    MapleNavigationController *navc = [[MapleNavigationController alloc]initWithRootViewController:childController];
    childController.navigationItem.title = title;
    [self addChildViewController:navc];
}

/**
 *  子控制器配置(已经去渲染)
 */
- (void)addChildViewController:(UIViewController *)childController
                   titleDidSet:(NSString*)titleDidSet
                         image:(NSString*)image
                 imageOriginal:(NSString*)imageOriginal
{
    UITabBarItem *item = [[UITabBarItem alloc]init];
    
    item.image = [UIImage imageNamed:image];
    //图片已经去渲染，在Assets.xcassets统一设置图片属性 Render As Original image
    item.selectedImage = [UIImage imageNamed:imageOriginal];
    //已统一设置文字属性
    item.title = titleDidSet;
    
    
    childController.tabBarItem = item;
    MapleNavigationController *navc = [[MapleNavigationController alloc]initWithRootViewController:childController];
    childController.navigationItem.title = titleDidSet;
    [self addChildViewController:navc];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
