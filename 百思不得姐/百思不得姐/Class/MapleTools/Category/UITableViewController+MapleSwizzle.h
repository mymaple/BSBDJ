//
//  UITableViewController+MapleSwizzle.h
//  百思不得姐
//
//  Created by mymaple on 16/9/25.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewController (MapleSwizzle)

/**
 *  初始化 view
 */
- (void)configView;


/**
 *  设置左按钮
 */
- (void)setLeftBarButtonItemWithImage:(NSString*)image
                            imageHigh:(NSString*)imageHigh
                               action:(SEL)sel;

/**
 *  设置右按钮
 */
- (void)setRightBarButtonItemWithImage:(NSString*)image
                             imageHigh:(NSString*)imageHigh
                                action:(SEL)sel;


@end
