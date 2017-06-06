//
//  YWNetworkStateTool.h
//  Wang66iOS
//
//  Created by 王亚文 on 2017/5/25.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetworkStateBlock)(NSString *networkState);


@interface YWNetworkStateTool : NSObject

+ (BOOL)isHaveNetwork;
+ (NSString *)networkState;
+ (void)startMonitorNetworkState;


@end
