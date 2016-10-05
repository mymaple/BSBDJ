//
//  MaplePublishViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/10/4.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MaplePublishViewController.h"

#import <POP.h>

#import "MapleVerticalButton.h"

@interface MaplePublishViewController ()

@end

@implementation MaplePublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self configView];
}


- (void)configView {
    //动画之前按钮不能点击
    self.view.userInteractionEnabled = NO;
    
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shareBottomBackground"]];
    backgroundImageView.frame = self.view.frame;
    backgroundImageView.userInteractionEnabled = YES;
    [backgroundImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toBack)]];
    [self.view addSubview:backgroundImageView];
    
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50);
    cancelBtn.backgroundColor = [UIColor whiteColor];
    cancelBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [cancelBtn addTarget:self action:@selector(toBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    
    CGFloat btnW = 72;
    CGFloat btnH = btnW + 30;
    NSArray *btnArr = @[
                    @[@"发视频",@"发图片",@"发段子",@"发声音",@"审帖",@"发链接"],
                    @[@"publish-video",@"publish-picture",@"publish-text",@"publish-audio",@"publish-review",@"publish-offline"]
                    ];
    for (NSInteger i = 0; i < 6; i++) {
        MapleVerticalButton *btn = [[MapleVerticalButton alloc]init];
        [btn setTitle:btnArr[0][i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:btnArr[1][i]] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        CGFloat marginx = 30;
        CGFloat margin = (SCREEN_WIDTH - 3 * btnW - 2 * marginx) / 2;
        CGFloat btnY = i > 2 ? SCREEN_HEIGHT * 0.35 + 30 + btnH : SCREEN_HEIGHT * 0.35;
        CGFloat btnX = marginx +(i % 3) * (btnW + margin);
        //btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        [self popAnimationWithObjtct:btn
                                from:CGRectMake(btnX, btnY - SCREEN_HEIGHT, btnW, btnH)
                                  to:CGRectMake(btnX, btnY, btnW, btnH)
                               delay:i];
    }
    
    UIImageView *app_sloganImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
    [app_sloganImageView sizeToFit];
    //    app_sloganImageView.mp_top = SCREEN_HEIGHT * 0.2;
    //    app_sloganImageView.mp_centerX = SCREEN_WIDTH * 0.5;
    CGFloat sloganW = (SCREEN_WIDTH - app_sloganImageView.mp_width) * 0.5;
    CGFloat sloganH = SCREEN_HEIGHT * 0.2;
    
    [self.view addSubview:app_sloganImageView];
    [[self popAnimationWithObjtct:app_sloganImageView
                            from:CGRectMake(sloganW, sloganH - SCREEN_HEIGHT, app_sloganImageView.mp_width, app_sloganImageView.mp_height)
                              to:CGRectMake(sloganW, sloganH, app_sloganImageView.mp_width, app_sloganImageView.mp_height)
                           delay:6]
     setCompletionBlock:^(POPAnimation *ani , BOOL finish) {
        self.view.userInteractionEnabled = YES;
    }];
    //去除初始影响
    app_sloganImageView.frame = CGRectZero;
}


- (POPSpringAnimation*)popAnimationWithObjtct:(id)obj from:(CGRect)from to:(CGRect)to delay:(NSInteger)i {
    POPSpringAnimation *ani = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    ani.fromValue = [NSValue valueWithCGRect:from];
    ani.toValue = [NSValue valueWithCGRect:to];
    ani.springBounciness = 10;
    ani.springSpeed = 10;
    ani.beginTime = CACurrentMediaTime() + 0.2 * i;
    [obj pop_addAnimation:ani forKey:nil];
    return ani;
}

- (void)toBack {
    [self toBackWithFinishBlock:nil];
}

- (void)toBackWithFinishBlock:(void(^)())block {
    self.view.userInteractionEnabled = NO;
    for (NSInteger i = 2; i < self.view.subviews.count; i++) {
        UIView *view = self.view.subviews[i];
        CGRect frame = view.frame;
        frame.origin.y += SCREEN_HEIGHT;
        POPBasicAnimation *ani = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
        ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        ani.duration = 0.2;
        ani.toValue = [NSValue valueWithCGRect:frame];
        ani.beginTime = CACurrentMediaTime() + 0.2 * (i-2);
        [view pop_addAnimation:ani forKey:nil];
        
        [ani setCompletionBlock:^(POPAnimation *ani , BOOL finish) {
            if (i == self.view.subviews.count-1) {
                [self dismissViewControllerAnimated:NO completion:nil];
                !block ?:block();
            }
        }];
    }
}

- (void)btnClick:(UIButton*)btn {
    [self toBackWithFinishBlock:^{
        if ([btn.titleLabel.text isEqualToString:@"发视频"]) {
            DebugLog(@"dasds");
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)toCancel:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
