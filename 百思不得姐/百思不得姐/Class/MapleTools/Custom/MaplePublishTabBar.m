//
//  MaplePublishTabBar.m
//  百思不得姐
//
//  Created by mymaple on 16/9/21.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MaplePublishTabBar.h"

#import "MaplePublishViewController.h"

@interface MaplePublishTabBar()
/**
 *  publishBtn
 */
@property (nonatomic, strong) UIButton *publishBtn;
@end

@implementation MaplePublishTabBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        
        [publishBtn addTarget:self action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishBtn];
        self.publishBtn = publishBtn;
        
    }
    return self;
}

- (void)clickPublish {
    //如果要实现半透明图层覆盖，可选择自定义 view 或者 vc.view 放到
    //当然要注意点击事件的控制,也可以通过新建窗口隔离实现
//    UIView *view = [[UIView alloc]init];
//    view.frame = SCREEN_BOUNDS;
//    view.backgroundColor = RGBA(0, 0, 0, 0.2);
//    [APPLICATION.keyWindow.rootViewController.view addSubview:view];
    
    MaplePublishViewController *vc = [[MaplePublishViewController alloc]init];
    [APPLICATION.keyWindow.rootViewController presentViewController:vc animated:NO completion:nil];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.publishBtn.bounds = CGRectMake(0, 0, self.publishBtn.currentBackgroundImage.size.width, self.publishBtn.currentBackgroundImage.size.height);
    [self.publishBtn sizeToFit];
    self.publishBtn.center = CGPointMake(self.mp_width*0.5, self.mp_height*0.5);
    
    NSInteger count = self.items.count;
    CGFloat btnH = self.mp_height;
    CGFloat btnW = self.mp_width / (count+1);
    NSInteger index = 0;
    for (UIView *btn in self.subviews) {
        if(![btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        CGFloat btnX = btnW * ((index >= count/2) ? (index + 1) : index);
        btn.frame = CGRectMake( btnX, 0, btnW, btnH);
        index++;
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
