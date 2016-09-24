//
//  MapleAFTools.m
//  百思不得姐
//
//  Created by mymaple on 16/9/22.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleAFHTTPTools.h"
#import "AFNetworking/AFNetworking.h"

@implementation MapleAFHTTPTools

+ (void)requestWihtMethod:(RequestMethodType)methodType
                      url:(NSString*)url
                   params:(NSDictionary*)params
                  success:(void (^)(id response))success
                  failure:(void (^)(NSError* err))failure
{
    //获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer.HTTPShouldHandleCookies = YES;
    [mgr.requestSerializer setTimeoutInterval:20];
    

    NSArray *arrayKeys = [params allKeys];
    
    NSString *strParams = [NSString stringWithFormat:@"\n-------------start\nurl:%@",url];
    for (NSString *strkey in arrayKeys)
    {
        NSString *str = [NSString stringWithFormat:@"\nkey:%@\nvalue:%@",strkey,[params objectForKey:strkey]];
        strParams = [strParams stringByAppendingString:str];
    }
    NSString *str = [NSString stringWithFormat:@"\n--------------end"];
    strParams = [strParams stringByAppendingString:str];
    DebugLog(@"%@",strParams);
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

}



@end
