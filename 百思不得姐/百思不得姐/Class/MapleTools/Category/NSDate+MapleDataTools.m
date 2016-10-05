//
//  NSDate+MapleDataTools.m
//  百思不得姐
//
//  Created by mymaple on 16/10/2.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "NSDate+MapleDataTools.h"

#import "DateTools/DateTools.h"

@implementation NSDate (MapleDataTools)

- (NSDateComponents*)omponentsSinceDate:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:self toDate:date options:0];
}

- (BOOL)isThisYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear;
    NSInteger nowYear = [calendar component:unit fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:unit fromDate:self];
    return nowYear == selfYear;
}

- (BOOL)isThisMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth;
    return YES;
}
@end
