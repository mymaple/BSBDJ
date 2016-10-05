//
//  MapleTagRecommendTableViewCell.m
//  百思不得姐
//
//  Created by mymaple on 16/9/25.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleTagRecommendTableViewCell.h"

#import "UIImageView+WebCache.h"


#import "MapleTagRecommend.h"
@interface MapleTagRecommendTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageListImageView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;
@property (weak, nonatomic) IBOutlet UIButton *isSubBtn;

@end

@implementation MapleTagRecommendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTagRecommend:(MapleTagRecommend *)tagRecommend {
    _tagRecommend = tagRecommend;
    
    
    [self.imageListImageView sd_setImageWithURL:[NSURL URLWithString:tagRecommend.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeNameLabel.text = tagRecommend.theme_name;
    //万人显示
    if(tagRecommend.sub_number < 10000)
        self.subNumberLabel.text = [NSString stringWithFormat:@"%zd人订阅",tagRecommend.sub_number];
    else
        self.subNumberLabel.text = [NSString stringWithFormat:@"%.1f万人订阅",tagRecommend.sub_number/10000.0];
    
}

/**
 *  使 cell 内凹的三种做法
 1.在 tableview 修改x ,w,h ,重写 cell的 setframe
 2.在 cell修改 contentview 修改x ,w,h
 3.在 cell 中套一层透明的 view修改x ,w,h
 */
-(void)setFrame:(CGRect)frame {
    frame.origin.x = 5;
    frame.size.width -= frame.origin.x*2;
    frame.size.height -= 1;
    
    [super setFrame:frame];
}
@end
