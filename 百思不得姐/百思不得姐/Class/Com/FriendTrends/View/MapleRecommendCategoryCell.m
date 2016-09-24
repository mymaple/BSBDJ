//
//  MapleRecommendCategoryCell.m
//  百思不得姐
//
//  Created by mymaple on 16/9/23.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleRecommendCategoryCell.h"
#import "MapleRecommendCategory.h"

@interface MapleRecommendCategoryCell ()
@property (weak, nonatomic) IBOutlet UIView *selectedMark;

@end



@implementation MapleRecommendCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    self.backgroundColor = RGB(246, 246, 246);
//    self.textLabel.textColor = RGB(73, 73, 73);
//    self.textLabel.highlightedTextColor = RGB(219, 21, 26);
}


-(void)setCategory:(MapleRecommendCategory *)category {
    _category = category;
    self.textLabel.text = category.name;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state`
    /**
     *  selection 为 default时选中 cell 会覆盖其他 view
        但是设置成 none 也会是原本的 textlabel 的 highlighted状态失效
     */
    self.selectedMark.hidden = !selected;
    self.textLabel.textColor = selected ? RGB(219, 21, 26) : RGB(73, 73, 73);;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.top = 2;
    self.textLabel.height = self.contentView.height - 2*self.textLabel.top;
    
}

@end
