//
//  BaseViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/21.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "BaseViewController.h"


#import "MapleBarButtonItem.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = BACKGROUND_COLOR;
    [self configView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configView {

}





/**
 *  设置左按钮
 */
- (void)setLeftBarButtonItemWithImage:(NSString*)image
                            imageHigh:(NSString*)imageHigh
                               action:(SEL)sel {
    self.navigationItem.leftBarButtonItem =
    [MapleBarButtonItem barButtonItemWithImage:image
                                     imageHigh:imageHigh
                                        target:self
                                        action:sel];
}

/**
 *  设置右按钮
 */
- (void)setRightBarButtonItemWithImage:(NSString*)image
                            imageHigh:(NSString*)imageHigh
                               action:(SEL)sel {
    self.navigationItem.rightBarButtonItem =
    [MapleBarButtonItem barButtonItemWithImage:image
                                     imageHigh:imageHigh
                                        target:self
                                        action:sel];
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
