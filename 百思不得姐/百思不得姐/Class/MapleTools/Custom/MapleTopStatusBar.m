//
//  MapleTopStatusBar.m
//  百思不得姐
//
//  Created by mymaple on 16/10/9.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleTopStatusBar.h"

@implementation MapleTopStatusBar

static MapleTopStatusBar *window_ ;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        window_ = [super allocWithZone:zone];
    });
    return window_;
}

+ (instancetype)shareStatusBar {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        window_ = [[self alloc]init];
        
    });
    return window_;
}

- (id)copyWithZone:(NSZone *)zone
{
    return window_;
}


+ (void)show {
    if(window_) {
        window_.hidden = NO;
        return;
    }
    [MapleTopStatusBar shareStatusBar].frame = APPLICATION.statusBarFrame;
    window_.backgroundColor = [UIColor clearColor];
    window_.windowLevel = UIWindowLevelAlert;
    
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor clearColor];
    vc.view.frame = APPLICATION.statusBarFrame;
    vc.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [vc.view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(windowClick)]];
    window_.rootViewController = vc;
    window_.hidden = NO;
}

+ (void)hide {
    if(window_) {
        window_.hidden = YES;
    }
}
/**
 *  点击监听
 */
+ (void)windowClick {
//    DebugLog(@"");
    [self scrollToTopInsideView:APPLICATION.keyWindow];
}

+ (void)scrollToTopInsideView:(UIView*)view {
    for (UIScrollView *subview in view.subviews) {
        if ([subview isKindOfClass:[UIScrollView class]]
            && [subview mp_isShowingOnWindow]) {
//            DebugLog(@"%@",subview);
            CGPoint offset = subview.contentOffset;
            offset.y = - subview.contentInset.top;
            [subview setContentOffset:offset animated:YES] ;
        }
        
        //搜索子控件
        [self scrollToTopInsideView:subview];
    }
}
@end
