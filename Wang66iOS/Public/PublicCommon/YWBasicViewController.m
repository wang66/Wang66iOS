//
//  YWBasicViewController.m
//  Wang66iOS
//
//  Created by renmaituan on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "YWBasicViewController.h"




@interface YWBasicViewController ()<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation YWBasicViewController


#pragma mark - life cycle

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        if(IOSVersion_moreThanEqual(@"7.0")){
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.extendedLayoutIncludesOpaqueBars = NO;
            self.automaticallyAdjustsScrollViewInsets = NO;

        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WhiteColor;
    
    [self addSlideGestureFunction];
    [self setupNavBar];
    
}

- (void)addSlideGestureFunction
{
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)]; // handleNavigationTransition为苹果系统侧滑的实现方法
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO; // 禁用系统自带的滑动手势
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.navigationController.childViewControllers.count!=1;
}



#pragma mark - setup UI

- (void)setupNavBar
{
    YWBasicViewController *firstVC = self.navigationController.viewControllers.firstObject;
    if([self class]==[firstVC class]){
        [self setLeftImage:nil];
    }else{
        [self setLeftImage:IMAGE(@"back_common")];
    }
    
    [self setRightImage:nil];
    
    [self.navigationController.navigationBar setBackgroundImage:IMAGE(@"navBg_common") forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}


- (void)setLeftImage:(UIImage *)image
{
    if(!image){
        self.navigationItem.leftBarButtonItem = nil;
        return;
    }
    
    UIImage *leftImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftImage
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self action:@selector(navBarLeftBtnClick:)];
}


- (void)setRightImage:(UIImage *)image
{
    if(!image){
        self.navigationItem.rightBarButtonItem = nil;
        return;
    }
    
    UIImage *rightImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightImage
                                                                             style:UIBarButtonItemStylePlain
                                                                             target:self action:@selector(navBarRightBtnClick:)];
}

#pragma mark - event response

- (void)navBarLeftBtnClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)navBarRightBtnClick:(id)sender
{
    
    
}

- (UITableView *)tableView
{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _tableView;
}






@end
