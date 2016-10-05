//
//  MaplePictureShowViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/10/4.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MaplePictureShowViewController.h"

#import <SVProgressHUD.h>
#import "UIImageView+WebCache.h"
#import "MapleEssence.h"
#import "DALabeledCircularProgressView.h"

@interface MaplePictureShowViewController ()
/**
 *  imageView
 */
@property (weak, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;

@end

@implementation MaplePictureShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [self.scrollView addSubview:imageView];
    self.imageView = imageView;
    
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toBack)]];
    
    
    CGFloat pictureW = SCREEN_WIDTH;
    CGFloat pictureH = self.essence.height / self.essence.width * pictureW;
    if (pictureH > SCREEN_HEIGHT) {
        imageView.frame = CGRectMake(0, 0, pictureW, pictureH);
        self.scrollView.contentSize = CGSizeMake(0, pictureH);
    }else{
        imageView.mp_size = CGSizeMake(pictureW, pictureH);
        imageView.mp_centerY = SCREEN_HEIGHT * 0.5;
    }
    
    //显示上一次下载进度
    self.progressView.progress = self.essence.pictureProgress;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.essence.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.progressView.hidden = NO;
        //-0处理,进度值保存
        self.essence.pictureProgress = fabs(1.0 * receivedSize / expectedSize);
        
        self.progressView.progress =  self.essence.pictureProgress;
        
        self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.f%%", self.essence.pictureProgress * 100];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.progressView.hidden = YES;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)toBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)toSave:(id)sender {
    if (self.imageView.image == nil) {
        [SVProgressHUD showErrorWithStatus:@"图片未下载完毕"];
        return;
    }
    
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        [SVProgressHUD showErrorWithStatus:@"保存失败"];
    }else{
        [SVProgressHUD showSuccessWithStatus:@"保存成功"];
    }
}
- (IBAction)toReture:(id)sender {
    
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
