//
//  MapleEssenceViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/21.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleEssenceViewController.h"

#import "MapleTagRecommendViewController.h"
#import "MapleEsssnceTableViewController.h"

@interface MapleEssenceViewController ()<UIScrollViewDelegate>

/**
 *  markView
 */
@property (nonatomic, weak) UIView *markView ;

/**
 *  titleView
 */
@property (nonatomic, weak) UIView *titleView ;


/**
 *  btnSelected
 */
@property (nonatomic, weak) UIButton *btnSelected ;

/**
 *  contentScrollView
 */
@property (nonatomic, weak) UIScrollView *contentScrollView ;

@end

@implementation MapleEssenceViewController

- (void)configView {
    [self configNavView];

    [self configTitleView];
    
    [self configContentScrollView];
    
    //1为全部，10为图片，29为段子，31为音频，41为视频，默认为1
    NSArray *essenceTypes = @[@1,@41,@31,@10,@29];
    for (NSInteger i = 0; i < self.titleView.subviews.count; i++) {
        MapleEsssnceTableViewController *vc = [[MapleEsssnceTableViewController alloc]init];
//        vc1.tableView.backgroundColor = [UIColor colorWithRed:arc4random() % 2 green:arc4random()% 2 blue:arc4random() % 2 alpha:1];
        vc.type = essenceTypes[i];
        [self addChildViewController:vc];
    }
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}



/**
 *  nav 设置
 */
- (void)configNavView {
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    [self setLeftBarButtonItemWithImage:@"MainTagSubIcon"
                              imageHigh:@"MainTagSubIconClick"
                                 action:@selector(leftClick:)];
}

/**
 *  标题栏
 */
- (void)configTitleView {
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.mp_width, 35)];
    /**
     *  颜色透明度设置方法
            1.RGBA(r, g, b, a);
            2.[[UIColor whiteColor]colorWithAlphaComponent:0.5];
            3.[UIColor colorWithWhite:1.0 alpha:0.5];
     */
    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    [self.view addSubview:titleView];
    self.titleView = titleView;
    
    CGFloat btnW = titleView.mp_width /5;
    
    UIView *markView = [[UIView alloc]init];
    markView.frame = CGRectMake(0, titleView.mp_bottom - 5, 0, 5);
    markView.backgroundColor = [UIColor redColor];
    [self.view addSubview:markView];
    self.markView = markView;
    
    
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnW*i, 0, btnW, titleView.mp_height);
        btn.tag = i;
        
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [btn addTarget:self action:@selector(titleSelect:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:btn];
        if (i==0) {
            [btn layoutIfNeeded];//[btn sizeToFit];
            self.markView.mp_width = btn.titleLabel.mp_width;
            self.markView.mp_centerX = btn.mp_centerX;
            btn.enabled = NO;
            self.btnSelected = btn;
        }
    }
    
}

- (void)titleSelect:(UIButton*)btn {
    if (btn != self.btnSelected){
        [UIView animateWithDuration:0.25 animations:^{
            //mark 移动
            self.markView.mp_width = btn.titleLabel.mp_width;
            self.markView.mp_centerX = btn.mp_centerX;
            //btn状态
            self.btnSelected.enabled = YES;
            btn.enabled = NO;
            self.btnSelected = btn;
        }];
        //
        [self.contentScrollView setContentOffset:CGPointMake(VIEW_WIDTH*btn.tag, 0)
                                        animated:YES];
        
    }
}

- (void)configContentScrollView {
    //取消自动调整UIScrollView的 insets
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *contentScrollView = [[UIScrollView alloc]init];
    //设置布局
    contentScrollView.frame = self.view.bounds;
    //设置内容大小
    contentScrollView.contentSize = CGSizeMake(VIEW_WIDTH*self.titleView.subviews.count, 0);
//    //设置内边距
//    contentScrollView.contentInset = UIEdgeInsetsMake(self.titleView.bottom, 0, self.tabBarController.tabBar.top, VIEW_WIDTH);
    
//    contentScrollView.backgroundColor = [UIColor redColor];
    
    
    contentScrollView.delegate = self;
    
    //分页
    contentScrollView.pagingEnabled = YES;
    //出具底部，使其他 view 显示在其之上
    [self.view insertSubview:contentScrollView atIndex:0];
    self.contentScrollView = contentScrollView;
    
}


- (void)leftClick:(UIButton*)btn {
    DebugLog(@"");
    
    MapleTagRecommendViewController *vc = [[MapleTagRecommendViewController alloc]init];
//    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma  mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / VIEW_WIDTH;
    UITableViewController *vc = self.childViewControllers[index];

    //去除状态栏影响y=20 and SCREEN_HEIGHT - h =20
    vc.view.frame = self.view.frame;
    vc.view.mp_left = scrollView.contentOffset.x;
//    DebugLog(@"%@",NSStringFromCGRect(self.view.frame))
    
    
    
    [self.contentScrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
    NSInteger index = scrollView.contentOffset.x / VIEW_WIDTH;
    [self titleSelect:self.titleView.subviews[index]];
}

@end
