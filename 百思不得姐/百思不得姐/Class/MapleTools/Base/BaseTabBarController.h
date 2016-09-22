//
//  BaseTabBarController.h
//  百思不得姐
//
//  Created by mymaple on 16/9/20.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarController : UITabBarController

- (void)configView;

/**
 *  子控制器配置
 */
- (void)addChildViewController:(UIViewController *)childController
                         title:(NSString*)title
                         image:(NSString*)image
                 imageSelected:(NSString*)imageSelected;

/**
 *  子控制器配置(已经去渲染)
 */
- (void)addChildViewController:(UIViewController *)childController
                   titleDidSet:(NSString*)titleDidSet
                         image:(NSString*)image
                 imageOriginal:(NSString*)imageOriginal;


@end
