//
//  MapleVerticalButton.m
//  百思不得姐
//
//  Created by mymaple on 16/9/27.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleVerticalButton.h"

@implementation MapleVerticalButton


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self configBtn];
    }
    return self;
}

//- (void)awakeFromNib {
//    [self configBtn];
//}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configBtn];
    }
    return self;
}

- (void)configBtn {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    //
    self.imageView.mp_top = 0;
    self.imageView.mp_left = 0;
    self.imageView.mp_width = self.mp_width;
    self.imageView.mp_height = self.mp_width;
    //
    self.titleLabel.mp_bottom = self.mp_height;
    self.titleLabel.mp_left = 0;
    self.titleLabel.mp_width = self.mp_width;
//    self.titleLabel.height = self.height - self.width;
}
@end
