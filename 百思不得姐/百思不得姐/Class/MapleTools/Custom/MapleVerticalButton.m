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
    self.imageView.top = 0;
    self.imageView.left = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.width;
    //
    self.titleLabel.bottom = self.height;
    self.titleLabel.left = 0;
    self.titleLabel.width = self.width;
//    self.titleLabel.height = self.height - self.width;
}
@end
