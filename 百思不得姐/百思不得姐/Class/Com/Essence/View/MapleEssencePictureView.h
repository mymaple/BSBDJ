//
//  MapleEssencePictureView.h
//  百思不得姐
//
//  Created by mymaple on 16/10/3.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MapleEssence;
@interface MapleEssencePictureView : UIView

/**
 *  MapleEssence
 */
@property (nonatomic, strong) MapleEssence *essence;

+ (instancetype)pictureView ;
@end
