//
//  YWNetworkStateTool.m
//  Wang66iOS
//
//  Created by 王亚文 on 2017/5/25.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "YWNetworkStateTool.h"
#import "AFNetworking.h"

@implementation YWNetworkStateTool

+ (void)initialize
{
    [super initialize];
    [[NSUserDefaults standardUserDefaults] setObject:kNetworkState_NotReachable forKey:kNetworkState];
}

+ (void)startMonitorNetworkState
{
    AFNetworkReachabilityManager *reachManager = [AFNetworkReachabilityManager sharedManager];
    [reachManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status)
        {
            case AFNetworkReachabilityStatusNotReachable: // 没有可达网络
            {
                [[NSUserDefaults standardUserDefaults] setObject:kNetworkState_NotReachable forKey:kNetworkState];
            }
                break;
            case AFNetworkReachabilityStatusUnknown: // 未识别的网络
            {
                [[NSUserDefaults standardUserDefaults] setObject:kNetworkState_unknown forKey:kNetworkState];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: // 2G,3G,4G网络
            {
                [[NSUserDefaults standardUserDefaults] setObject:kNetworkState_wwan forKey:kNetworkState];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: // wifi
            {
                [[NSUserDefaults standardUserDefaults] setObject:kNetworkState_wifi forKey:kNetworkState];
            }
                break;
                
            default:
                break;
        }
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
    [reachManager startMonitoring]; // 开始监听网络
}

+ (BOOL)isHaveNetwork
{
    
    NSString *netStateStr = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:kNetworkState];
    if([netStateStr isEqualToString:kNetworkState_NotReachable]){
        return NO;
    }
    return YES;
}

+ (NSString *)networkState
{
    NSString *netStateStr = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:kNetworkState];
    return netStateStr;
}

@end
