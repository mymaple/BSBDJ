//
//  MapleRecommendCategory.m
//  百思不得姐
//
//  Created by mymaple on 16/9/23.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleRecommendCategory.h"

@implementation MapleRecommendCategory



- (NSMutableArray *)users{
    if(!_users){
        _users = [NSMutableArray array];
    }
    return _users;
}


@end
