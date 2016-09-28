//
//  MapleLoginRegisterViewController.h
//  百思不得姐
//
//  Created by mymaple on 16/9/27.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    MapleLogin,
    MapleRegister
}MapleLoginType;

@interface MapleLoginRegisterViewController : UIViewController
/**
 *  MapleLoginType
 */
@property (nonatomic, assign) MapleLoginType type;
- (instancetype)initWithType:(MapleLoginType)type;
@end
