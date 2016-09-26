//
//  MapleTagRecommend.h
//  百思不得姐
//
//  Created by mymaple on 16/9/25.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapleTagRecommend : NSObject
/**
 *  is_sub	int	是否含有子标签
 theme_id	string	此标签的id
 theme_name	string	标签名称
 sub_number	string	此标签的订阅量
 is_default	int	是否是默认的推荐标签
 image_list	string	推荐标签的图片url地址
 */

/**
 *  是否含有子标签
 */
@property (nonatomic, assign) NSInteger is_sub;

/**
 *  此标签的id
 */
@property (nonatomic, copy) NSString *theme_id;

/**
 *  标签名称
 */
@property (nonatomic, copy) NSString *theme_name;

/**
 *  此标签的订阅量
 */
@property (nonatomic, assign) NSInteger sub_number;

/**
 *  是否是默认的推荐标签
 */
@property (nonatomic, assign) NSInteger is_default;

/**
 *  推荐标签的图片url地址
 */
@property (nonatomic, copy) NSString *image_list;
@end
