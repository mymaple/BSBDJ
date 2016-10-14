//
//  MapleTopStatusBar.h
//  百思不得姐
//
//  Created by mymaple on 16/10/9.
//  Copyright © 2016年 mymaple. All rights reserved.
//



//set info.plist    View controller-based status bar appearance == NO
#import <UIKit/UIKit.h>

@interface MapleTopStatusBar : UIWindow

+ (instancetype)shareStatusBar ;
//+ (void)shareStatusBar ;
+ (void)show ;

+ (void)hide ;
@end
