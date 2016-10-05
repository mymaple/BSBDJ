//
//  NSArray+MapleUnicode.m
//  百思不得姐
//
//  Created by mymaple on 16/10/1.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "NSArray+MapleUnicode.h"
#import "NSObject+MapleUnicode.h"
#import <objc/runtime.h>

@implementation NSArray (MapleUnicode)

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(description)), class_getInstanceMethod([self class], @selector(replaceDescription)));
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(descriptionWithLocale:)), class_getInstanceMethod([self class], @selector(replaceDescriptionWithLocale:)));
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(descriptionWithLocale:indent:)), class_getInstanceMethod([self class], @selector(replaceDescriptionWithLocale:indent:)));
}

- (NSString *)replaceDescription {
    return [NSObject maple_stringByReplaceUnicode:[self replaceDescription]];
}

- (NSString *)replaceDescriptionWithLocale:(nullable id)locale {
    return [NSObject maple_stringByReplaceUnicode:[self replaceDescriptionWithLocale:locale]];
}

- (NSString *)replaceDescriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [NSObject maple_stringByReplaceUnicode:[self replaceDescriptionWithLocale:locale indent:level]];
}


@end
