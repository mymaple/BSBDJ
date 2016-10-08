//
//  MapleCommentTableViewCell.m
//  百思不得姐
//
//  Created by mymaple on 16/10/6.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleCommentTableViewCell.h"

#import "UIImageView+WebCache.m"


#import "MapleTopCmt.h"
#import "MapleUser.h"

@interface MapleCommentTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *profile_imageView;
@property (weak, nonatomic) IBOutlet UIImageView *sexImageView;

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *like_countLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *voiceBtn;

@end


@implementation MapleCommentTableViewCell

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


- (void)setCmt:(MapleTopCmt *)cmt {
    _cmt = cmt;
    [self.profile_imageView sd_setImageWithURL:[NSURL URLWithString:cmt.user.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
   
    self.sexImageView.image = [cmt.user.sex isEqualToString:@"m"] ? [UIImage imageNamed:@"Profile_manIcon"] : [UIImage imageNamed:@"Profile_womanIcon"];
    self.usernameLabel.text = cmt.user.username;
    self.like_countLabel.text = [NSString stringWithFormat:@"%zd",cmt.like_count];
    self.contentLabel.text = cmt.content;
    
    if (cmt.content.length > 0) {
        self.voiceBtn.hidden = YES;
    }else{
        self.voiceBtn.hidden = NO;
        [self.voiceBtn setTitle:[NSString stringWithFormat:@"%zd''",cmt.voicetime] forState:UIControlStateNormal];
    }
}

- (void)setFrame:(CGRect)frame {
    
    //    frame.origin.x = MPMargin;
    //    frame.size.width -= 2*MPMargin;
    //    frame.origin.y += MPMargin;
    //    frame.size.height -= MPMargin;
    frame = CGRectMake(MPMargin,frame.origin.y + MPMargin
                       , frame.size.width - 2*MPMargin
                       , frame.size.height);
    [super setFrame:frame];
}

@end
