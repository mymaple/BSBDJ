//
//  UITableViewController+MapleSwizzle.m
//  百思不得姐
//
//  Created by mymaple on 16/9/25.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "UITableViewController+MapleSwizzle.h"
#import "BaseViewController.h"
#import <objc/runtime.h>

@implementation UITableViewController (MapleSwizzle)

#pragma mark - swizzle test
+ (void)load
{
    Method method1 = class_getInstanceMethod([BaseViewController class], @selector(setLeftBarButtonItemWithImage:imageHigh:action:));
    Method method2 = class_getInstanceMethod([self class], @selector(setLeftBarButtonItemWithImage:imageHigh:action:));
//    method_exchangeImplementations(method1, method2);
    method_setImplementation(method2,  method_getImplementation(method1));
    
    Method method3 = class_getInstanceMethod([BaseViewController class], @selector(setRightBarButtonItemWithImage:imageHigh:action:));
    Method method4 = class_getInstanceMethod([self class], @selector(setRightBarButtonItemWithImage:imageHigh:action:));
//    method_exchangeImplementations(method3, method4);

    method_setImplementation(method4,  method_getImplementation(method3));
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = BACKGROUND_COLOR;
    [self configView];
}

/**
 *  初始化 view
 */
- (void)configView {
    
}


/**
 *  设置左按钮
 */
- (void)setLeftBarButtonItemWithImage:(NSString*)image
                            imageHigh:(NSString*)imageHigh
                               action:(SEL)sel {
    
}

/**
 *  设置右按钮
 */
- (void)setRightBarButtonItemWithImage:(NSString*)image
                             imageHigh:(NSString*)imageHigh
                                action:(SEL)sel {
    
}



@end
