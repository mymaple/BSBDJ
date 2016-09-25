//
//  MapleAFTools.h
//  百思不得姐
//
//  Created by mymaple on 16/9/22.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RequestMethodType){
    RequestMethodTypePost = 1,
    RequestMethodTypeGet = 2
};
@interface MapleAFHTTPTools : NSObject
+ (void)requestWihtMethod:(RequestMethodType)methodType
                      url:(NSString*)url
                   params:(NSDictionary*)params
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError* err))failure;
@end
