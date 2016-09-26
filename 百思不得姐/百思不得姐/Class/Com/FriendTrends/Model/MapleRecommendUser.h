//
//  MapleRecommendUser.h
//  百思不得姐
//
//  Created by mymaple on 16/9/24.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapleRecommendUser : NSObject
/**
 *   "uid": "8918517",
 "screen_name": "泡面来了",
 "introduction": "",
 "fans_count": "9021",
 "tiezi_count": 17,
 "header": "http:%/%/img.spriteapp.cn%/profile%/large%/2014%/10%/22%/544712a631641_mini.jpg",
 "gender": 2,
 "is_follow": 0
 */

/**
 *  uid
 */
@property (nonatomic, copy) NSString *uid;

/**
 *  screen_name
 */
@property (nonatomic, copy) NSString *screen_name;

/**
 *  introduction
 */
@property (nonatomic, copy) NSString *introduction;

/**
 *  fans_count
 */
@property (nonatomic, assign) NSInteger fans_count;

/**
 *  tiezi_count
 */
@property (nonatomic, assign) NSInteger tiezi_count;

/**
 *  header
 */
@property (nonatomic, copy) NSString *header;

/**
 *  gender
 */
@property (nonatomic, assign) NSInteger gender;

/**
 *  is_follow
 */
@property (nonatomic, assign) NSInteger is_follow;

@end
