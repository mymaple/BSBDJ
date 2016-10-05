//
//  MapleEssence.m
//  百思不得姐
//
//  Created by mymaple on 16/9/30.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleEssence.h"

//#import <MJExtension.h>

@implementation MapleEssence
{
    CGFloat _cellHeight ;
    CGRect _pictureF ;
    BOOL _seeBigBtnHide ;
}

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"small_image" : @"image0",
             @"middle_image" : @"image2",
             @"large_image" : @"image1"
             };
}

- (CGFloat)cellHeight {
    if(!_cellHeight){
        _cellHeight =  60;
        CGSize maxSize = CGSizeMake(SCREEN_WIDTH - 40, MAXFLOAT);
        CGFloat textH = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height ;
        _cellHeight += textH + MPMargin;
        
        if (self.type == EssenceTypePicture) {
            CGFloat pictureW = maxSize.width;
            CGFloat pictureH = pictureW / self.width * self.height;
            _seeBigBtnHide = YES;
            if(pictureH > MPPictureMAXH && [self.large_image.pathExtension isEqualToString:@"jpg"]){
                pictureH = MPPictureREH;
                _seeBigBtnHide = NO;
            }
            
            
            _pictureF = CGRectMake(MPMargin,_cellHeight, pictureW, pictureH);
            
            _cellHeight += pictureH + MPMargin;
        }
        
        _cellHeight += 41 + MPMargin;
    }
    return _cellHeight;
}

@end
