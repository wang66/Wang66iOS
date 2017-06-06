//
//  HomeListCell.h
//  Wang66iOS
//
//  Created by wang66 on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeListModel;
@interface HomeListCell : UITableViewCell

- (void)refreshContent:(HomeListModel *)homeListModel;
+ (CGFloat)cellHeight:(HomeListModel *)homeListModel;
@end
