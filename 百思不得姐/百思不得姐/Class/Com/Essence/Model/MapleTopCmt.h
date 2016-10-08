//
//  MapleTopCmt.h
//  百思不得姐
//
//  Created by mymaple on 16/10/6.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MapleUser;

@interface MapleTopCmt : NSObject

/**
 *  ID
 */
@property (nonatomic, copy) NSString *ID;

/**
 *  content
 */
@property (nonatomic, copy) NSString *content;

/**
 *  voiceuri
 */
@property (nonatomic, copy) NSString *voiceuri;

/**
 *  voicetime
 */
@property (nonatomic, assign) NSInteger voicetime;

/**
 *  like_count
 */
@property (nonatomic, assign) NSInteger like_count;

/**
 *  user
 */
@property (nonatomic, strong) MapleUser *user;






@end
