//
//  HomeViewController.m
//  Wang66iOS
//
//  Created by renmaituan on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "HomeViewController.h"
#import "FindViewController.h"
#import "HomeListModel.h"
#import "HomeListCell.h"
#import "NSDate+YWExtension.h"
#import "YWNetworkStateTool.h"
#import "HomeDetailViewController.h"



@interface HomeViewController ()

@property (nonatomic, strong)NSMutableArray         *tableViewData;
@property (nonatomic, strong)NSTimer                *timer;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    [self initData];
    [self loadTableView];
    
    [self requestHotList]; // 请求网络数据
    
    [self performSelector:@selector(getNetworkState) withObject:nil afterDelay:3.f];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setHidesBottomBarWhenPushed:YES];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self setHidesBottomBarWhenPushed:NO];
    [super viewWillDisappear:animated];
}



- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}

- (void)initData
{
    _tableViewData = [NSMutableArray array];
//    for(int i=0; i<20;i++)
//    {
//        HomeListModel *model = [HomeListModel new];
//        model.name = @"真正的高手，能高到哪儿去，谁也不知道。李小龙曾经说：我所知道的武功，跟我正在练的武功，完全不是同一个东西。";
//        [_tableViewData addObject:model];
//    }
}

- (void)loadTableView
{
//    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(pullRefresh)];
//    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    self.tableView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height-49.f-64.f);
    [self.view addSubview:self.tableView];
}

- (void)getNetworkState
{
    YWDebugLog(@"%@",[YWNetworkStateTool networkState]);
}





- (void)requestHotList
{
    __weak HomeViewController *weakSelf = self;
    [[HttpManager shareManager] getWithURL:HotList parameters:nil showHUD:YES responseBlock:^(ResponseResult *result) {
        [weakSelf.tableView.header endRefreshing];
        [_tableViewData removeAllObjects];
        NSArray *dataArr = [HomeListModel mj_objectArrayWithKeyValuesArray:result.resultInfo];
        if(dataArr.count<=PageSize){
            [weakSelf.tableView.footer setHidden:YES];
        }
        [_tableViewData addObjectsFromArray:dataArr];
        [weakSelf.tableView reloadData];
    }];
}


#pragma mark - refresh and load more

- (void)pullRefresh
{
//    if([self.tableView.footer isHidden]){
//        [self.tableView.footer setHidden:YES];
//    }
//    _page = 1;
    [self requestHotList];
}

- (void)loadMore
{
    
}


#pragma mark - tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableViewData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeListModel *model = _tableViewData[indexPath.row];
    return model.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    HomeListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil){
        cell = [[HomeListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    HomeListModel *model = _tableViewData[indexPath.row];
    [cell refreshContent:model];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HomeListModel *model = _tableViewData[indexPath.row];
    HomeDetailViewController *homeDetailVC = [HomeDetailViewController new];
    homeDetailVC.content = model.name;
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:homeDetailVC animated:YES];
    [self setHidesBottomBarWhenPushed:NO];
}


@end
