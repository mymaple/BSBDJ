//
//  MapleEssence.h
//  百思不得姐
//
//  Created by mymaple on 16/9/30.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MapleTopCmt;

@interface MapleEssence : NSObject

/**
 *  name	string	发帖人的昵称
 */
@property (nonatomic, copy) NSString *name;

/**
 *  profile_image	string	头像的图片url地址
 */
@property (nonatomic, copy) NSString *profile_image;

/**
 *  created_at	string	系统审核通过后创建帖子的时间
 */
@property (nonatomic, copy) NSString *created_at;

/**
 *  text	string	帖子的内容
 */
@property (nonatomic, copy) NSString *text;

/**
 *  ding
 */
@property (nonatomic, assign) NSInteger ding;

/**
 *  cai	string	踩的人数
 */
@property (nonatomic, assign) NSInteger cai;

/**
 *  repost	string	转发的数量
 */
@property (nonatomic, assign) NSInteger repost;

/**
 *  comment	string	帖子的被评论数量
 */
@property (nonatomic, assign) NSInteger comment;

/**
 *  EssenceType
 */
@property (nonatomic, assign) EssenceType type;

/**
 *  sina_v
 */
@property (nonatomic, assign) NSInteger sina_v;


/**
 *  small_image
 */
@property (nonatomic, copy) NSString *small_image;


/**
 *  middle_image
 */
@property (nonatomic, copy) NSString *middle_image;


/**
 *  large_image
 */
@property (nonatomic, copy) NSString *large_image;


/**
 *  width
 */
@property (nonatomic, assign) CGFloat width;


/**
 *  height
 */
@property (nonatomic, assign) CGFloat height;


/**
 *  playfcount
 */
@property (nonatomic, assign) NSInteger playfcount;


/**
 *  voicetime
 */
@property (nonatomic, assign) NSInteger voicetime;

/**
 *  videotime
 */
@property (nonatomic, assign) NSInteger videotime;


/**
 *  top_cmt
 */
@property (nonatomic, strong) NSArray<MapleTopCmt*> *top_cmt;

/**
 *  ID
 */
@property (nonatomic, copy) NSString *ID;

//辅助属性

/**
 *  cellHeight
 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

/**
 *  cellHeight
 */
@property (nonatomic, assign, readonly) CGRect pictureF;

/**
 *  cellHeight
 */
@property (nonatomic, assign, readonly) BOOL seeBigBtnHide;

/**
 *  pictureProgress
 */
@property (nonatomic, assign) CGFloat pictureProgress;
@end
