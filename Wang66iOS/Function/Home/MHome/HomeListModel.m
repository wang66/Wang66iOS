//
//  HomeListModel.m
//  Wang66iOS
//
//  Created by wang66 on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "HomeListModel.h"
#import "HomeListCell.h"

@implementation HomeListModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"hotId":@"id"};
}

- (CGFloat)cellHeight
{
    if(!_cellHeight){
        _cellHeight = [HomeListCell cellHeight:self];
    }
    return _cellHeight;
}
@end
