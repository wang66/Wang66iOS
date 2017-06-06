//
//  HomeListModel.h
//  Wang66iOS
//
//  Created by wang66 on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeListModel : NSObject

//commodityTypeCode = "SALES_GROUP";
//createdTime = "2016-12-19T03:48:30+08:00";
//createdUserId = string;
//icon = "pingtuan/new_commodity/%E8%8B%B9%E6%9E%9C%E8%AF%B4/%E7%94%9F%E9%B2%9C%E6%B0%B4%E6%9E%9C@3x.png";
//id = 3;
//lastUpdateTime = "2016-12-19T03:48:30+08:00";
//lastUpdateUserId = string;
//level = 2;
//link = 3;
//name = "\U751f\U9c9c\U6c34\U679c";
//sort = 1;
//type = 1;
//visitCount = 80000;
@property (nonatomic,copy)NSString              *commodityTypeCode;
@property (nonatomic,copy)NSString              *createdTime;
@property (nonatomic,copy)NSString              *createdUserId;
@property (nonatomic,copy)NSString              *icon;
@property (nonatomic,copy)NSString              *hotId;
@property (nonatomic,copy)NSString              *lastUpdateTime;
@property (nonatomic,copy)NSString              *lastUpdateUserId;
@property (nonatomic,copy)NSString              *level;
@property (nonatomic,copy)NSString              *link;
@property (nonatomic,copy)NSString              *name;
@property (nonatomic,copy)NSString              *sort;
@property (nonatomic,copy)NSString              *type;
@property (nonatomic,copy)NSString              *visitCount;

@property (nonatomic, assign)CGFloat             cellHeight;

- (CGFloat)cellHeight;
@end
