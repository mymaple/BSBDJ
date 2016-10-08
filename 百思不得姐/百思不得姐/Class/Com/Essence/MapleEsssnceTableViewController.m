//
//  MapleEsssnceTableViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/29.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleEsssnceTableViewController.h"

#import "MJExtension.h"
#import "MJRefresh.h"

#import "UITableViewController+MapleSwizzle.h"
#import "MapleAFHTTPTools.h"

#import "MapleEssenceTableViewCell.h"
#import "MapleEssence.h"
#import "MapleCommentViewController.h"

static NSString* const MPEssence = @"Essence";
@interface MapleEsssnceTableViewController()
/**
 *  essnces
 */
@property (nonatomic, strong) NSMutableArray<MapleEssence*> *essnces;

/**
 *  maxtime
 */
@property (nonatomic, copy) NSString *maxtime;

/**
 *  param
 */
@property (nonatomic, strong) NSDictionary *param;

@end

@implementation MapleEsssnceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self configTableView];
    [self refreshTableView];
    [self.tableView.mj_header beginRefreshing];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}


-(void)configTableView {
    //注册 cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MapleEssenceTableViewCell class]) bundle:nil]  forCellReuseIdentifier:MPEssence];
    
    //设置 tableview 内边距
    self.tableView.contentInset = UIEdgeInsetsMake(MPNavB + MPTitleViewH, 0, MPTabH, 0);
    
    //设置滚动条内边距
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    //无分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //背景色
    self.tableView.backgroundColor = [UIColor clearColor];
}

#pragma  mark - refreshTableView
- (void)refreshTableView {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    //自动改变标签透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    //or use back normal
}

#pragma  mark - loadData
- (void)headerRefresh {

    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"list";
    param[@"c"] = @"data";
    //1为全部，10为图片，29为段子，31为音频，41为视频，默认为1
    param[@"type"] = self.type;
    self.param = param;

    [MapleAFHTTPTools requestWihtMethod:RequestMethodTypeGet url:UrlMain params:param success:^(id responseObject) {
        
        if(self.param != param) return;
        
        DebugLog(@"%@",responseObject);
        self.maxtime = responseObject[@"info"][@"maxtime"];
        self.essnces = [MapleEssence mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *err) {
        if(self.param != param) return;
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)footerRefresh {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"list";
    param[@"c"] = @"data";
    //1为全部，10为图片，29为段子，31为音频，41为视频，默认为1
    param[@"type"] = self.type;
    param[@"maxtime"] = self.maxtime;
    
    self.param = param;
    
    [MapleAFHTTPTools requestWihtMethod:RequestMethodTypeGet url:UrlMain params:param success:^(id responseObject) {
        
        if(self.param != param) return;
        
        DebugLog(@"%@",responseObject);
        
        self.maxtime = responseObject[@"info"][@"maxtime"];
        [self.essnces addObjectsFromArray:[MapleEssence mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *err) {
        if(self.param != param) return;
        [self.tableView.mj_footer endRefreshing];
    }];
}




#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.essnces.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MapleEssenceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MPEssence];
    cell.essence = self.essnces[indexPath.row];
    

    return cell;
}

#pragma  mark - UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.essnces[indexPath.row].cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MapleCommentViewController *vc = [[MapleCommentViewController alloc]init];
    vc.essence = self.essnces[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


/**
 *  状态栏隐藏
 */
//-(BOOL)prefersStatusBarHidden {
//    return YES;
//}

@end
