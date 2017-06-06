//
//  HomeDetailViewController.m
//  Wang66iOS
//
//  Created by wang66 on 2017/5/26.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "HomeDetailViewController.h"


@interface HomeDetailViewController ()

@property (nonatomic, strong)UILabel                *contentLab;

@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详情";
    self.view.backgroundColor = RandomColor;
    
    [self setRightImage:IMAGE(@"shop_unselected")];

    _contentLab = [[YWLabel alloc] initWithFrame:CGRectMake(15.f, 0, Screen_Width-30.f, ContentView_Height)];
    _contentLab.textAlignment = NSTextAlignmentCenter;
    _contentLab.font = FONT(20);
    [_contentLab labelText:self.content lineSpacing:5.f];
    _contentLab.numberOfLines = 0;
    _contentLab.backgroundColor = ClearColor;
    [self.view addSubview:_contentLab];
}


- (void)navBarRightBtnClick:(id)sender
{
    
}



@end
