//
//  MapleEsssnceTableViewController.h
//  百思不得姐
//
//  Created by mymaple on 16/9/29.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    EssenceTypeAll,
    EssenceTypeviode,
    EssenceTypeSound,
    EssenceTypePicture,
    EssenceTypeWord
}EssenceType;
@interface MapleEsssnceTableViewController : UITableViewController
/**
 *  essenceType
 */
@property (nonatomic, assign) EssenceType essenceType;
@end
