//
//  MapleRecommendUserCell.m
//  百思不得姐
//
//  Created by mymaple on 16/9/24.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleRecommendUserCell.h"
#import "MapleRecommendUser.h"
#import <UIImageView+WebCache.h>

@interface MapleRecommendUserCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *isFollowBtn;

@end

@implementation MapleRecommendUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setUser:(MapleRecommendUser *)user {
    _user = user;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header]
                            placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.screenNameLabel.text = user.screen_name;
    self.fansCountLabel.text = user.fans_count;
    self.isFollowBtn.selected = user.is_follow == 1;
}

@end
