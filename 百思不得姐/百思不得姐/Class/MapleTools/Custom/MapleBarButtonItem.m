//
//  MapleBarButtonItem.m
//  百思不得姐
//
//  Created by mymaple on 16/9/22.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleBarButtonItem.h"

@implementation MapleBarButtonItem


/**
 *  生成barButtonItem
 */
+ (instancetype)barButtonItemWithImage:(NSString*)image
                                 imageHigh:(NSString*)imageHigh
                                    target:(id)target
                                    action:(SEL)sel {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageHigh] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:btn];
}

/**
 *  生成barButtonItem
 */
+ (instancetype)barButtonItemWithImage:(NSString*)image
                                 imageHigh:(NSString*)imageHigh
                                     title:(NSString*)title
                                    target:(id)target
                                    action:(SEL)sel {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageHigh] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    //UIBarButtonItem居左
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //再靠左一点
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:btn];
}

@end
