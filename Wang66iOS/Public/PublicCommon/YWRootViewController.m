//
//  YWRootViewController.m
//  Wang66iOS
//
//  Created by 王亚文 on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "YWRootViewController.h"
#import "HomeViewController.h"
#import "ShopViewController.h"
#import "FindViewController.h"
#import "MyViewController.h"
#import "YWBasicNavigationController.h"



@interface YWRootViewController ()<UITabBarControllerDelegate>

@end

@implementation YWRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self setupTabBar];
    [self loadChildVCs];
}

- (void)setupTabBar
{
    self.tabBar.barStyle = UIBarStyleDefault;
    [self.tabBar setShadowImage:[UIImage new]];
    self.tabBar.backgroundColor = WhiteColor;
}

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleDefault;
//}

- (void)loadChildVCs
{
    UIImage *selectedImage = [UIImage imageNamed:@"home_selected"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    HomeViewController *home1VC = [[HomeViewController alloc] init];
    [self addChild:home1VC title:@"首页" image:IMAGE(@"home_unselected") selectedImage:IMAGE(@"home_selected")];
    
    ShopViewController *shopVC = [ShopViewController new];
    [self addChild:shopVC title:@"商城" image:IMAGE(@"shop_unselected") selectedImage:IMAGE(@"shop_selected")];
    
    FindViewController *findVC = [FindViewController new];
    [self addChild:findVC title:@"发现" image:IMAGE(@"find_unselected") selectedImage:IMAGE(@"find_selected")];
    
    MyViewController *myVC = [MyViewController new];
    [self addChild:myVC title:@"我的" image:IMAGE(@"my_unselected") selectedImage:IMAGE(@"my_selected")];
}

- (void)addChild:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:LightGrayColor, NSFontAttributeName:FONT(11)} forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:RedColor, NSFontAttributeName:FONT(11)} forState:UIControlStateSelected];
    
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:navC];
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}


@end
