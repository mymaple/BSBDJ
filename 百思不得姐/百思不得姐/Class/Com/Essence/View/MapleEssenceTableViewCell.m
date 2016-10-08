//
//  MapleEssenceTableViewCell.m
//  百思不得姐
//
//  Created by mymaple on 16/10/1.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleEssenceTableViewCell.h"

#import "UIImageView+WebCache.h"
#import "DateTools/DateTools.h"
#import <Masonry.h>

#import "MapleEssence.h"
#import "MapleEssencePictureView.h"
#import "MapleTopCmt.h"
#import "MapleUser.h"

@interface MapleEssenceTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UIImageView *sina_v;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *midView;
@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;

/**
 *  text_label
 */
@property (nonatomic, weak) IBOutlet UILabel *text_label;

/**
 *  pictureView
 */
@property (nonatomic, weak) MapleEssencePictureView *pictureView;
@property (weak, nonatomic) IBOutlet UIView *cmtView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end
@implementation MapleEssenceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    
    self.backgroundView = imageView;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma  mark - property
- (MapleEssencePictureView *)pictureView {
    if(!_pictureView){
        MapleEssencePictureView *pictureView = [MapleEssencePictureView pictureView];
        [self addSubview:pictureView];
        _pictureView = pictureView;
    }
    return _pictureView;
}

-(void)setEssence:(MapleEssence *)essence {
    _essence = essence;
    [self.profileImage sd_setImageWithURL:[NSURL URLWithString:essence.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.sina_v.hidden = essence.sina_v != 1;
    
    
    self.nameLabel.text = essence.name;
    
    NSDate *created_at = [NSDate dateWithString:essence.created_at formatString:MPFmt];
    
    self.timeLabel.text = created_at.timeAgoSinceNow;
    
    
    self.text_label.text = essence.text;
    
    
    [self.dingBtn setTitle:[self toString:essence.ding withPlaceholder:@"顶"] forState:UIControlStateNormal];
    [self.caiBtn setTitle:[self toString:essence.cai withPlaceholder:@"踩"] forState:UIControlStateNormal];
    [self.shareBtn setTitle:[self toString:essence.repost withPlaceholder:@"转发"] forState:UIControlStateNormal];
    [self.commentBtn setTitle:[self toString:essence.comment withPlaceholder:@"评论"] forState:UIControlStateNormal];
    
    self.pictureView.hidden = YES;
    
    if (essence.type == EssenceTypePicture || essence.type == EssenceTypeSound || essence.type == EssenceTypeViode) {
        self.pictureView.hidden = NO;
        self.pictureView.frame = essence.pictureF;
        self.pictureView.essence = essence;
    }
    
    if (essence.top_cmt.count > 0) {
        self.cmtView.hidden = NO;
        self.contentLabel.text = [NSString stringWithFormat:@"%@:%@",essence.top_cmt[0].user.username,essence.top_cmt[0].content];
    }else{
        self.cmtView.hidden = YES;
    }
    
 
    
}

- (NSString*)toString:(NSInteger)integer withPlaceholder:(NSString*)placeholder{
    //万人显示
    if(integer == 0)
        return placeholder;
    else if(integer < 10000)
        return [NSString stringWithFormat:@"%zd",integer];
    else
        return [NSString stringWithFormat:@"%.1f万",integer/10000.0];
}



- (void)setFrame:(CGRect)frame {

//    frame.origin.x = MPMargin;
//    frame.size.width -= 2*MPMargin;
//    frame.origin.y += MPMargin;
//    frame.size.height -= MPMargin;
    frame = CGRectMake(MPMargin,frame.origin.y + MPMargin
                       , frame.size.width - 2*MPMargin
                       , frame.size.height - MPMargin);
    [super setFrame:frame];
}
@end
