//
//  YWAlertTool.m
//  Wang66iOS
//
//  Created by wang66 on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "YWAlertTool.h"
#import "MBProgressHUD.h"
#import "SVProgressHUD.h"


@implementation YWAlertTool

+ (void)initialize
{
    [SVProgressHUD setBackgroundLayerColor:[[UIColor darkGrayColor] colorWithAlphaComponent:0.3]];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD setInfoImage:nil];
}

+ (void)showTextHUD:(NSString *)text
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showTextHUD:text showTime:1.5f];
    });
}

+ (void)showTextHUD:(NSString *)text showTime:(CGFloat)showTime
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = text;
    hud.margin = 10.f;
    hud.yOffset = 0;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:showTime];
}

+ (void)showSuccessHUDWithText:(NSString *)successText
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    [SVProgressHUD setMinimumDismissTimeInterval:2.0f];
    [SVProgressHUD showSuccessWithStatus:successText];
}

+ (void)showErrorHUDWithText:(NSString *)errorText
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    [SVProgressHUD setMinimumDismissTimeInterval:2.0f];
    [SVProgressHUD showErrorWithStatus:errorText];
}

+ (void)showLoadingHUD
{
    [SVProgressHUD setCornerRadius:15.0f];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    [SVProgressHUD show];
}

+ (void)hideLoadingHUD
{
    [SVProgressHUD dismiss];
}

@end
