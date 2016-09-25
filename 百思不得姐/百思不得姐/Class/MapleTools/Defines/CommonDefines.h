//
//  CommonDefines.h
//  AddressBook
//
//  Created by mymaple on 16/8/27.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#ifndef CommonDefines_h
#define CommonDefines_h



#pragma mark - 获取设备大小
//-------------------获取设备大小-------------------------
//NavBar高度
#define NavigationBar_HEIGHT 44
//获取屏幕 宽度、高度
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_BOUNDS ([UIScreen mainScreen].bounds)

//-------------------获取设备大小-------------------------



#pragma mark - 判断机器型号及系统版本
//-------------------判断机器型号及系统版本-----------------
#define IS_IPHONE_4 ([UIScreen mainScreen].bounds.size.height == 480)
#define IS_IPAD     ([[UIDevice currentDevice].model hasPrefix:@"iPad"])

#define IS_IOS_6    ([UIDevice currentDevice].systemVersion.floatValue >= 6.0 && [UIDevice currentDevice].systemVersion.floatValue < 7.0)
#define IS_IOS_7    ([UIDevice currentDevice].systemVersion.floatValue >= 7.0 && [UIDevice currentDevice].systemVersion.floatValue < 8.0)
#define IS_IOS_8    ([UIDevice currentDevice].systemVersion.floatValue >= 8.0 && [UIDevice currentDevice].systemVersion.floatValue < 9.0)
//-------------------判断机器型号及系统版本-----------------


#pragma mark - Debug模式下打印日志和当前行数
//-------------------Debug模式下打印日志和当前行数-----------
//#ifdef DEBUG
//#define DebugLog( fmt, ... ) NSLog( @"[file:%s function:%s line:(%d)] /n content:%@", __FILE__, __FUNCTION__, __LINE__, [NSString stringWithFormat:(fmt), ##__VA_ARGS__] )
//#else
//#define DebugLog( fmt, ... )
//#endif


#ifdef DEBUG
#define DebugLog( fmt, ... ) NSLog( @"\n[file:%@-->function:%s-->line:(%d)] \n-->content:%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __FUNCTION__ , __LINE__, [NSString stringWithFormat:(fmt), ##__VA_ARGS__] )
#else
#define DebugLog( fmt, ... )
#endif
//-------------------Debug模式下打印日志和当前行数-----------

#pragma mark - 图片
//----------------------图片----------------------------
//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]

//建议使用前两种宏定义,性能高于后者
//----------------------图片----------------------------


#pragma mark - 颜色类
//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//背景色
#define BACKGROUND_COLOR [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0]

//清除背景色
#define CLEARCOLOR [UIColor clearColor]


//----------------------颜色类--------------------------

#pragma mark - 常用单例
//----------------------常用单例--------------------------
#define USERDEFAULTS [NSUserDefaults standardUserDefaults]                  //本地存储
#define FILEMANAGER [NSFileManager defaultManager]                          //文件管理
#define APPLICATION [UIApplication sharedApplication]
#define APPLICATIONDELEGATE [[UIApplication sharedApplication] delegate]
//----------------------常用单例--------------------------


#pragma mark - 网络请求
//----------------------网络请求--------------------------
//网络请求地址URL
#define UrlMainIP                     @"http://192.168.76.115:8080"
//域名
//#define UrlMain                     [NSString stringWithFormat:@"%@/lbms/mobile/smsAction.do",UrlMainIP]
#define UrlMain                       @"http://api.budejie.com/api/api_open.php"
//路径
#define UrlRentstatisticstype  [NSString stringWithFormat:@"%@/lbms/mobile/rentstatisticstypeAction.do?operAtt=leasingPicture",UrlMainIP]
//----------------------网络请求--------------------------
#endif /* CommonDefines_h */
