//
//  MaplePlaceholderTextField.m
//  百思不得姐
//
//  Created by mymaple on 16/9/28.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MaplePlaceholderTextField.h"

static NSString* const MaplePlaceholderTextColor = @"placeholderLabel.textColor";

@implementation MaplePlaceholderTextField


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self configPlaceholder];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configPlaceholder];
    }
    return self;
}

- (void)configPlaceholder {
    //设置光标颜色为文字颜色
    self.tintColor = self.textColor;
    //设置placeholder初始色
    [self resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
    [self setValue:[UIColor whiteColor] forKeyPath:MaplePlaceholderTextColor];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    [self setValue:[UIColor grayColor] forKeyPath:MaplePlaceholderTextColor];
    return [super resignFirstResponder];
}
@end
