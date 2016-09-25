//
//  MapleRecommendViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/23.
//  Copyright © 2016年 mymaple. All rights reserved.
//

/**
 *  问题 1.只显示第一数据，缺少下拉加载动能
 2.点击 category重复加载让费流量
 3.网络延时造成，user数据图片滞留
 
 4.当前页加载进行中，又点击其他页加载
 */
#import "MapleRecommendViewController.h"

#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import <MJRefresh.h>

#import "MapleRecommendCategory.h"
#import "MapleRecommendCategoryCell.h"
#import "MapleRecommendUser.h"
#import "MapleRecommendUserCell.h"
#import "MapleAFHTTPTools.h"


static NSString* const MAPLECategroy = @"categroy";
static NSString* const MAPLEUser= @"user";
#define SELECTEDCATEGORY self.categories[[self.categroyTableView indexPathForSelectedRow].row]

@interface MapleRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 *  左边类别数据
 */
@property (nonatomic, strong) NSArray<MapleRecommendCategory*> *categories;

/**
 *  左边类别表
 */
@property (weak, nonatomic) IBOutlet UITableView *categroyTableView;


/**
 *  右边类别数据
 */
//@property (nonatomic, strong) NSArray<MapleRecommendUser*> *users;

/**
 *  右边类别表
 */
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

/**
 *  AFHTTPSessionManager
 */
@property (nonatomic, strong) AFHTTPSessionManager *mgr;

@end

@implementation MapleRecommendViewController

#pragma  mark - property

- (AFHTTPSessionManager *)mgr{
    if(!_mgr){
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}

- (void)configView {
    //cell 注册
    [self.categroyTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MapleRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:MAPLECategroy];
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MapleRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:MAPLEUser];
    
    [self refreshTableView:self.userTableView];
    
    //Scroll 自动调整设置
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categroyTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.rowHeight = 70;
    
    self.title = @"推荐关注";
//    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"category";
    param[@"c"] = @"subscribe";
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
//    [self.mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [SVProgressHUD dismiss];
//        DebugLog(@"%@",responseObject);
//        self.categories = [MapleRecommendCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
//        [self.categroyTableView reloadData];
//        //自动选择首行
//        [self.categroyTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
//        [self.userTableView.mj_header beginRefreshing];
////        [self tableView:self.categroyTableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [SVProgressHUD showErrorWithStatus:@"加载失败！"];
//        DebugLog(@"%@",error);
//    }];
    //网络连接方法抽取
    [MapleAFHTTPTools requestWihtMethod:RequestMethodTypeGet
                                    url:UrlMain params:param
                                success:^(id responseObject) {
        self.categories = [MapleRecommendCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.categroyTableView reloadData];
        //自动选择首行
        [self.categroyTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        [self.userTableView.mj_header beginRefreshing];
    } failure:nil];
}

#pragma  mark - userTableView上拉下拉刷新
- (void)refreshTableView:(UITableView *)tableView {
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self
                                                           refreshingAction:@selector(headerRefresh)];
    
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self
                                                               refreshingAction:@selector(footerRereshing)];
}

- (void)headerRefresh {
    
    //保持 category一致，防止异步请求category错乱
    MapleRecommendCategory *category = SELECTEDCATEGORY;
    category.currentPage = 0;
    
    
//    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"list";
    param[@"c"] = @"subscribe";
    param[@"category_id"] = category.id;
    //当前页初始为0 先加再处理
    param[@"page"] = @(++category.currentPage);
    //网络请求延时调试，传参不延时！！！！！！
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [SVProgressHUD show];
//        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
//        [self.mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            
//            
////            [SVProgressHUD dismiss];
//            DebugLog(@"%@",responseObject);
//            //删除之前数据
//            [category.users removeAllObjects];
//            //users 数据存入对应的 category ，避免重复加载
//            [category.users addObjectsFromArray:[MapleRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
//            //上拉刷新 footer 状态控制
//            category.total = [responseObject[@"total"] integerValue];
//            
//            //判断是否为当前选中的category_id
//            NSLog(@"--------%@------%@",param[@"category_id"],category.id);
//            if(![param[@"category_id"] isEqualToString:category.id]) return;
//            
//            [self.userTableView reloadData];
//            
//            [self.userTableView.mj_header endRefreshing];
//            [self checkFooterState];
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            
//            //判断是否为当前选中的category_id
//            NSLog(@"--------%@------%@",param[@"category_id"],category.id);
//            if(![param[@"category_id"] isEqualToString:category.id]) return;
//            
//            //失败也需要结束刷新
//            [self.userTableView.mj_header endRefreshing];
//            [SVProgressHUD showErrorWithStatus:@"加载失败！"];
//            DebugLog(@"%@",error);
//        }];
        //网络连接方法抽取
        [MapleAFHTTPTools requestWihtMethod:RequestMethodTypeGet
                                        url:UrlMain params:param
                                    success:^(id responseObject) {
            //删除之前数据
            [category.users removeAllObjects];
            //users 数据存入对应的 category ，避免重复加载
            [category.users addObjectsFromArray:[MapleRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
            //上拉刷新 footer 状态控制
            category.total = [responseObject[@"total"] integerValue];
            
            //判断是否为当前选中的category_id
            NSLog(@"--------%@------%@",param[@"category_id"],category.id);
            if(![param[@"category_id"] isEqualToString:category.id]) return;
            
            [self.userTableView reloadData];
            
            [self.userTableView.mj_header endRefreshing];
            [self checkFooterState];
        } failure:^(NSError *err) {
            //判断是否为当前选中的category_id
            NSLog(@"--------%@------%@",param[@"category_id"],category.id);
            if(![param[@"category_id"] isEqualToString:category.id]) return;
            //失败也需要结束刷新
            [self.userTableView.mj_header endRefreshing];
        }];
        
    });
}

- (void)footerRereshing {
    //保持 category一致，防止异步请求category错乱
    MapleRecommendCategory *category = SELECTEDCATEGORY;
//    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"list";
    param[@"c"] = @"subscribe";
    param[@"category_id"] = category.id;
    param[@"page"] = @(++category.currentPage);
    //网络请求延时调试，传参不延时！！！！！！
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [SVProgressHUD show];
//        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
//        [self.mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            
////            [SVProgressHUD dismiss];
//            DebugLog(@"%@",responseObject);
//            //users 数据存入对应的 category ，避免重复加载
//            [category.users addObjectsFromArray:[MapleRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
//            
//            //上拉刷新 footer 状态控制
//            category.total = [responseObject[@"total"] integerValue];
//            
//            //判断是否为当前选中的category_id
//            NSLog(@"--------%@------%@",param[@"category_id"],category.id);
//            if(![param[@"category_id"] isEqualToString:category.id]) return;
//            
//            
//            [self.userTableView reloadData];
//           
//            [self checkFooterState];
//            
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            
//            //判断是否为当前选中的category_id
//            NSLog(@"--------%@------%@",param[@"category_id"],category.id);
//            if(![param[@"category_id"] isEqualToString:category.id]) return;
//            
//            [self.userTableView.mj_footer endRefreshing];
//            [SVProgressHUD showErrorWithStatus:@"加载失败！"];
//            DebugLog(@"%@",error);
//        }];
        //网络连接方法抽取
        [MapleAFHTTPTools requestWihtMethod:RequestMethodTypeGet
                                        url:UrlMain params:param
                                    success:^(id responseObject) {
            //users 数据存入对应的 category ，避免重复加载
            [category.users addObjectsFromArray:[MapleRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
            
            //上拉刷新 footer 状态控制
            category.total = [responseObject[@"total"] integerValue];
            
            //判断是否为当前选中的category_id
            NSLog(@"--------%@------%@",param[@"category_id"],category.id);
            if(![param[@"category_id"] isEqualToString:category.id]) return;
            
            
            [self.userTableView reloadData];
            
            [self checkFooterState];
        } failure:^(NSError *err) {
            //判断是否为当前选中的category_id
            NSLog(@"--------%@------%@",param[@"category_id"],category.id);
            if(![param[@"category_id"] isEqualToString:category.id]) return;
            
            [self.userTableView.mj_footer endRefreshing];
        }];
    });
}

//检查 footer状态
- (void)checkFooterState {
    if(SELECTEDCATEGORY.users.count < SELECTEDCATEGORY.total){
        [self.userTableView.mj_footer endRefreshing];
    }else{
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    }
}

#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.categroyTableView)
        return self.categories.count;
    
    //users 无数据是不显示 footer
    self.userTableView.mj_footer.hidden = SELECTEDCATEGORY.users.count == 0;
    //判断当前页 footer 显示状态,避免出现footer状态被上一页面覆盖问题
    [self checkFooterState];
    return SELECTEDCATEGORY.users.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView == self.categroyTableView){
        MapleRecommendCategoryCell *categoryCell = [self.categroyTableView dequeueReusableCellWithIdentifier:MAPLECategroy];
        categoryCell.category = self.categories[indexPath.row];
        return categoryCell;
    }
    MapleRecommendUserCell *userCell = [self.userTableView dequeueReusableCellWithIdentifier:MAPLEUser];
    userCell.user = SELECTEDCATEGORY.users[indexPath.row];
    return userCell;
}

#pragma  mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView == self.categroyTableView){
        [self.userTableView.mj_header endRefreshing];
        [self.userTableView.mj_footer endRefreshing];
        if(SELECTEDCATEGORY.users.count == 0){
            //重新刷新user表格，马上显示 category 的当前数据,避免数据滞留问题
            [self.userTableView reloadData];
            [self.userTableView.mj_header beginRefreshing];
        }else{
            
            [self.userTableView reloadData];
        }
    }
}

#pragma  mark - 控制器销毁
- (void)dealloc {
    //控制器销毁时，取消所有请求
    [self.mgr.operationQueue cancelAllOperations];
}
@end
