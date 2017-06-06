//
//  YWBasicViewController.h
//  Wang66iOS
//
//  Created by renmaituan on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YWBasicViewController : UIViewController

@property (nonatomic, strong)UITableView            *tableView;


- (void)setLeftImage:(UIImage *)image;

- (void)setRightImage:(UIImage *)image;


- (void)navBarLeftBtnClick:(id)sender;

- (void)navBarRightBtnClick:(id)sender;


@end
