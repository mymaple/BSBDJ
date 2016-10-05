//
//  MapleEssencePictureView.m
//  百思不得姐
//
//  Created by mymaple on 16/10/3.
//  Copyright © 2016年 mymaple. All rights reserved.
//

/**
 *  一般使用 自定义类/分类 来 包装/继承 三方自定义类，来避免三方使用调换风险
 */

#import "MapleEssencePictureView.h"
#import "MapleEssence.h"
#import "UIImageView+WebCache.h"
#import "DALabeledCircularProgressView.h"
#import "MaplePictureShowViewController.h"

@interface MapleEssencePictureView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigBtn;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;

@property (weak, nonatomic) IBOutlet UILabel *playfcountLabel;

@property (weak, nonatomic) IBOutlet UILabel *voicetimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *voiceBtn;
@property (weak, nonatomic) IBOutlet UIButton *videoBtn;

@end

@implementation MapleEssencePictureView


+ (instancetype)pictureView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

- (void)awakeFromNib {
    //以固定 view 的 form 去除自动伸缩
    self.autoresizingMask = UIViewAutoresizingNone;
    self.progressView.progressLabel.textColor = [UIColor whiteColor];
    self.progressView.roundedCorners = 2;
    
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pictureShow)]];
}

- (void)pictureShow {
//    NSLog(@"dsadasd");
    MaplePictureShowViewController *vc = [[MaplePictureShowViewController alloc]init];
    vc.essence = self.essence;
    [APPLICATION.keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
    
}

- (void)setEssence:(MapleEssence *)essence {
    _essence = essence;
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:essence.large_image]];
    
    
    //显示上一次下载进度
    self.progressView.progress = essence.pictureProgress;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:essence.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.progressView.hidden = NO;
        //-0处理,进度值保存
        essence.pictureProgress = fabs(1.0 * receivedSize / expectedSize);
        
        self.progressView.progress =  essence.pictureProgress;
        
        self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.f%%", essence.pictureProgress * 100];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.progressView.hidden = YES;
        //大图设置
        if(!essence.seeBigBtnHide){
            //开启图片绘制上下文
            UIGraphicsBeginImageContextWithOptions(essence.pictureF.size, YES, 0.0);
            //计算缩放宽高
            CGFloat pictureW = essence.pictureF.size.width ;
            CGFloat pictureH = pictureW * image.size.height / image.size.width;
            
            [image drawInRect:CGRectMake(0, 0, pictureW, pictureH)];
            
            self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            
            //
            UIGraphicsEndImageContext();
        }
    }];
    
    
    self.seeBigBtn.hidden = essence.type != EssenceTypePicture;
    self.gifView.hidden = essence.type != EssenceTypePicture;
    self.videoBtn.hidden = essence.type != EssenceTypeViode;
    self.playfcountLabel.hidden = essence.type != EssenceTypeSound && essence.type != EssenceTypeViode;
    self.voicetimeLabel.hidden = essence.type != EssenceTypeSound && essence.type != EssenceTypeViode;
    self.voiceBtn.hidden = essence.type != EssenceTypeSound;

    if (essence.type == EssenceTypePicture ) {
        self.seeBigBtn.hidden = essence.seeBigBtnHide;
        //判断后缀名 也可通过图片数据第一个字节判断，图片类型
        NSString *extension = essence.large_image.pathExtension;
        self.gifView.hidden = ![extension isEqualToString:@"gif"];
        
    }else if(essence.type == EssenceTypeSound ) {
        self.playfcountLabel.text = [self toString:essence.playfcount withPlaceholder:@"暂无点播"];
        self.voicetimeLabel.text = [NSString stringWithFormat:@"%2zd:%2zd",essence.voicetime/60,essence.voicetime%60];
    }else if(essence.type == EssenceTypeViode ) {
        self.playfcountLabel.text = [self toString:essence.playfcount withPlaceholder:@"暂无点播"];
        self.voicetimeLabel.text = [NSString stringWithFormat:@"%2zd:%2zd",essence.videotime/60,essence.videotime%60];
    }
}

- (NSString*)toString:(NSInteger)integer withPlaceholder:(NSString*)placeholder{
    //万人显示
    if(integer == 0)
        return placeholder;
    else if(integer < 10000)
        return [NSString stringWithFormat:@"%zd点播",integer];
    else
        return [NSString stringWithFormat:@"%.1f万点播",integer/10000.0];
}


@end
