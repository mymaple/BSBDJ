//
//  MapleLoginRegisterViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/27.
//  Copyright © 2016年 mymaple. All rights reserved.
//

/**
 *btn 圆角设置
    1.    //边框圆角
            self.loginBtn.layer.cornerRadius = 5;
            //设置 btn 所有layer 都遵循边框
            self.loginBtn.layer.masksToBounds = YES;
    2.通过 xib kvc 设置
 *
 */


#import "MapleLoginRegisterViewController.h"

@interface MapleLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeftMargin;
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterBtn;

@end

@implementation MapleLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if(self.type == MapleRegister)
        [self registerBtn:nil];
    APPLICATION.statusBarStyle = UIStatusBarStyleLightContent;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (instancetype)initWithType:(MapleLoginType)type{
    if(self = [super init]){
        self.type = type;
    }
    return self;
}




#pragma  mark - 状态栏文字设置

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    //亮色
//    return UIStatusBarStyleLightContent;
//}

- (IBAction)closeViewController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        APPLICATION.statusBarStyle = UIStatusBarStyleDefault;
    }];
}


- (IBAction)registerBtn:(UIButton*)sender {
    if(self.loginViewLeftMargin.constant != 0 && sender == self.loginRegisterBtn){
        self.loginViewLeftMargin.constant = 0;
        [self.loginRegisterBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    }else{
        self.loginViewLeftMargin.constant = -SCREEN_WIDTH;
        [self.loginRegisterBtn setTitle:@"登录账号" forState:UIControlStateNormal];
    }
    if (sender) {
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
    
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
