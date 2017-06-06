//
//  YWAlertTool.h
//  Wang66iOS
//
//  Created by wang66 on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWAlertTool : NSObject

+ (void)showTextHUD:(NSString *)text;

+ (void)showTextHUD:(NSString *)text showTime:(CGFloat)showTime;

+ (void)showSuccessHUDWithText:(NSString *)successText;

+ (void)showErrorHUDWithText:(NSString *)errorText;

+ (void)showLoadingHUD;

+ (void)hideLoadingHUD;



@end
