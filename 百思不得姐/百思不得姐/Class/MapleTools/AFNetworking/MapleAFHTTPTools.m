//
//  MapleAFTools.m
//  百思不得姐
//
//  Created by mymaple on 16/9/22.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleAFHTTPTools.h"
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>

@implementation MapleAFHTTPTools
//网络连接方法抽取
+ (void)requestWihtMethod:(RequestMethodType)methodType
                      url:(NSString*)url
                   params:(NSDictionary*)params
                  success:(void (^)(id responseObject))success
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
    switch (methodType) {
        case RequestMethodTypeGet:
        {
            //GET请求
            [mgr GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [SVProgressHUD dismiss];
                DebugLog(@"\nresponseObject:\n%@",responseObject);
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DebugLog(@"\nerr:\n%@",error);
                if (failure) {
                    failure(error);
                }
                
                AFNetworkReachabilityManager *mgrReach = [AFNetworkReachabilityManager sharedManager];
                [mgrReach setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
                    
                    /**
                     *      AFNetworkReachabilityStatusUnknown          = -1,  无法识别
                     AFNetworkReachabilityStatusNotReachable     = 0,   无网络
                     AFNetworkReachabilityStatusReachableViaWWAN = 1,    流量
                     AFNetworkReachabilityStatusReachableViaWiFi = 2,     wifi
                     */
                    NSLog(@"------%zd",status);
                    if (status == AFNetworkReachabilityStatusReachableViaWWAN
                        || status== AFNetworkReachabilityStatusReachableViaWiFi)
                    {
                        [SVProgressHUD showErrorWithStatus:@"网络不给力啊"];
                    }
                    else
                    {
                        [SVProgressHUD showErrorWithStatus:@"无网络连接，请检查网络"];
                    }
                }];
                [mgrReach startMonitoring];
            }];
        } break;
            
            
        case RequestMethodTypePost:
        {
            //POST请求
            [mgr POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [SVProgressHUD dismiss];
                DebugLog(@"\nresponseObject:\n%@",responseObject);
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DebugLog(@"\nerr:\n%@",error);
                if (failure) {
                    failure(error);
                }
                AFNetworkReachabilityManager *mgrReach = [AFNetworkReachabilityManager sharedManager];
                [mgrReach setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
                    /**
                     *      AFNetworkReachabilityStatusUnknown          = -1,  无法识别
                     AFNetworkReachabilityStatusNotReachable     = 0,   无网络
                     AFNetworkReachabilityStatusReachableViaWWAN = 1,    流量
                     AFNetworkReachabilityStatusReachableViaWiFi = 2,     wifi
                     */
                    NSLog(@"------%zd",status);
                    if (status == AFNetworkReachabilityStatusReachableViaWWAN
                        || status== AFNetworkReachabilityStatusReachableViaWiFi)
                    {
                        //                        AlertWithTitleAndMessageAndDelegateAndCancelTitleAndOtherTitles(@"提示", @"网络不给力啊", self, @"确定", nil);
                    }
                    else
                    {
                        //                        AlertWithTitleAndMessageAndDelegateAndCancelTitleAndOtherTitles(@"提示", @"无网络连接，请检查网络", self, @"确定", nil);
                    }
                }];
                [mgrReach startMonitoring];
            }];
        }
            break;
        default:
            break;
    }

}



@end
