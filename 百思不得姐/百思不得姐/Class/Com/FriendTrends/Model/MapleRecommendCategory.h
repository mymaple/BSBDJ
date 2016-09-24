//
//  MapleRecommendCategory.h
//  百思不得姐
//
//  Created by mymaple on 16/9/23.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MapleRecommendCategory : NSObject

/**
 *  标签名称
 */
@property (nonatomic, copy) NSString *name;

/**
 *  此标签下的用户数
 */
@property (nonatomic, copy) NSString *count;

/**
 *  标签id
 */
@property (nonatomic, copy) NSString *id;

/**
 *  users
 */
@property (nonatomic, strong) NSMutableArray *users;

@end
