//
//  NSDate+YWExtension.m
//  Wang66iOS
//
//  Created by 王亚文 on 2017/5/26.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "NSDate+YWExtension.h"

@implementation NSDate (YWExtension)

+ (NSString *)currentDateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd hh:mm:ss";
    NSString *dateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    return dateStr;
}

- (NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-MM-dd hh:mm:ss";
    NSString *dateStr = [dateFormatter stringFromDate:self];
    
    return dateStr;
}


@end
