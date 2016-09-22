//
//  MapleBarButtonItem.h
//  百思不得姐
//
//  Created by mymaple on 16/9/22.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapleBarButtonItem : UIBarButtonItem

/**
 *  生成barButtonItem
 */
+ (instancetype)barButtonItemWithImage:(NSString*)image
                                 imageHigh:(NSString*)imageHigh
                                    target:(id)target
                                    action:(SEL)sel;
/**
 *  生成barButtonItem
 */
+ (instancetype)barButtonItemWithImage:(NSString*)image
                                 imageHigh:(NSString*)imageHigh
                                     title:(NSString*)title
                                    target:(id)target
                                    action:(SEL)sel;

@end
