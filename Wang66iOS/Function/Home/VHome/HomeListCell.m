//
//  HomeListCell.m
//  Wang66iOS
//
//  Created by wang66 on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "HomeListCell.h"
#import "HomeListModel.h"


@interface HomeListCell ()

@property (nonatomic, strong)YWLabel            *mainLab;

@property (nonatomic, strong)HomeListModel      *homeListModel;
@end

@implementation HomeListCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadContentView];
    }
    
    return self;
}

- (void)loadContentView
{
    self.backgroundColor = RandomColor;
    
    _mainLab = [YWLabel create];
    _mainLab.font = FONT(14);
    _mainLab.textColor = LightGrayColor;
    _mainLab.numberOfLines = 0;
    [self addSubview:_mainLab];
    LAY(_mainLab.left, self.left, 1, 10);
    LAY(_mainLab.right, self.right, 1, -10);
    LAY(_mainLab.top, self.top, 1, 10.f);
}

+ (CGFloat)cellHeight:(HomeListModel *)homeListModel
{
    if(!homeListModel){
        return 44.f;
    }
    return [YWLabel sizeLabelWith:Screen_Width-20.f text:NilStrHandle(homeListModel.name) font:FONT(14) lineSpacing:4.f].height+40.f;
}

- (void)clearCellData
{
    _mainLab.text = @"";
}

- (void)refreshContent:(HomeListModel *)homeListModel
{
    [self clearCellData];
    if(!homeListModel){
        return;
    }
    _homeListModel = homeListModel;
    _mainLab.text = NilStrHandle(homeListModel.name);
//    [_mainLab labelText:NilStrHandle(homeListModel.name) lineSpacing:4.f];
    
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
