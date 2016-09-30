//
//  MaplePushguideView.m
//  百思不得姐
//
//  Created by mymaple on 16/9/28.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MaplePushguideView.h"
static NSString* const MAPLEBUNDLEKEY = @"CFBundleShortVersionString";

@implementation MaplePushguideView


+ (instancetype)pushguideView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}


+ (void)showIn:(UIView*)view{
    if(![[USERDEFAULTS valueForKey:MAPLEBUNDLEKEY] isEqualToString:[NSBundle mainBundle].infoDictionary[MAPLEBUNDLEKEY]]){
        //初始化显示
        MaplePushguideView *pushguideView = [MaplePushguideView pushguideView];
        pushguideView.frame = view.bounds;
        [view addSubview:pushguideView];
        [USERDEFAULTS setObject:[NSBundle mainBundle].infoDictionary[MAPLEBUNDLEKEY] forKey:MAPLEBUNDLEKEY];
    }
}




- (IBAction)closePushguide:(id)sender {
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
