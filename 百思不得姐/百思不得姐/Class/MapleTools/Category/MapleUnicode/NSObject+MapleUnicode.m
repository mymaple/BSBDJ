//
//  NSObject+MapleUnicode.m
//  百思不得姐
//
//  Created by mymaple on 16/10/1.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "NSObject+MapleUnicode.h"

@implementation NSObject (MapleUnicode)

+ (NSString *)maple_stringByReplaceUnicode:(NSString *)string
{
    NSMutableString *convertedString = [string mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U" withString:@"\\u" options:0 range:NSMakeRange(0, convertedString.length)];
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    return convertedString;
}
    
@end
