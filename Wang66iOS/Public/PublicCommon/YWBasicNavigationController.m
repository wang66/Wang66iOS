//
//  YWBasicNavigationController.m
//  Wang66iOS
//
//  Created by renmaituan on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "YWBasicNavigationController.h"



@interface YWBasicNavigationController ()

@end

@implementation YWBasicNavigationController


+ (void)initialize
{
//    UINavigationBar *navBarAppearance = [UINavigationBar appearance];
//    [navBarAppearance setBackgroundImage:IMAGE(@"navBg_common") forBarMetrics:UIBarMetricsDefault];
//    [navBarAppearance setShadowImage:[UIImage new]];
//    [navBarAppearance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:FONT(15)}];
//
//    
//    UIBarButtonItem *barItemAppearance = [UIBarButtonItem appearance];
//    [barItemAppearance setBackButtonBackgroundImage:IMAGE(@"back_common") forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [barItemAppearance setBackButtonBackgroundImage:IMAGE(@"back_common") forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
//    [barItemAppearance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:FONT(15)} forState:UIControlStateNormal];
//    [barItemAppearance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:FONT(15)} forState:UIControlStateSelected];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WhiteColor;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    viewController.hidesBottomBarWhenPushed = YES;
}

@end
