//
//  BaseNavigationController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/22.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleNavigationController.h"
#import "MapleBarButtonItem.h"

@implementation MapleNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configView {
    //设置文字
    
}

/**
 * 拦截所有 PUSH 进来的 VC
 *  统一设置 push 后的左按钮为返回
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    //非根控制器
    if (self.childViewControllers.count > 0) {
        //返回键修改不能使用自定义,由于viewController在后面初始化
//        viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style: UIBarButtonItemStyleDone target:nil action:nil];

        viewController.navigationItem.leftBarButtonItem =
        [MapleBarButtonItem barButtonItemWithImage:@"navigationButtonReturn"
                                         imageHigh:@"navigationButtonReturnClick"
                                             title:@"返回"
                                            target:self
                                            action:@selector(back:)];
        //push 后工具栏隐藏
        viewController.hidesBottomBarWhenPushed = YES;

    }
    
    
    
    //放在后面的原因是 ，可以让控制器自定义的左按钮覆盖
    [super pushViewController:viewController animated:animated];
}

- (void)back:(UIButton*)btn {
    [self popViewControllerAnimated:YES];
}
@end
