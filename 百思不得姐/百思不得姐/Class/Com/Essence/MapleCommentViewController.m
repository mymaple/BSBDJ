//
//  MapleCommentViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/10/6.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleCommentViewController.h"

#import <MJRefresh.h>
#import <MJExtension.h>

#import "MapleEssenceTableViewCell.h"
#import "MapleEssence.h"
#import "MapleAFHTTPTools.h"
#import "MapleTopCmt.h"
#import "MapleCommentTableViewCell.h"

static NSString* const MPEssence = @"Essence";
static NSString* const MPComment = @"comment";
@interface MapleCommentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 *  param
 */
@property (nonatomic, strong) NSMutableDictionary *param;

/**
 *  hotCmts
 */
@property (nonatomic, strong) NSMutableArray<MapleTopCmt*> *hotCmts;

/**
 *  cmts
 */
@property (nonatomic, strong) NSMutableArray<MapleTopCmt*> *cmts;


@end

@implementation MapleCommentViewController

- (void)configView {
    [self configNav];
    [self configTableView];
    [self.tableView.mj_header beginRefreshing];
}

- (void)configNav {
    self.title = @"评论";
    [self setRightBarButtonItemWithImage:@"comment_nav_item_share_icon" imageHigh:@"comment_nav_item_share_icon_click" action:@selector(rightClick:)];
}

- (void)rightClick:(UIButton*)btn{
    
}

- (void)configTableView {
    //注册 cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MapleEssenceTableViewCell class]) bundle:nil]  forCellReuseIdentifier:MPEssence];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MapleCommentTableViewCell class]) bundle:nil] forCellReuseIdentifier:MPComment];
    
    self.tableView.contentInset = UIEdgeInsetsMake(MPNavB, 0, MPTabH, 0);
    //刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    
    self.tableView.estimatedRowHeight = 100;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)headerRefresh {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"dataList";
    param[@"c"] = @"comment";
    param[@"data_id"] = self.essence.ID;
    param[@"hot"] = @"1";
    self.param = param;
    
    [MapleAFHTTPTools requestWihtMethod:RequestMethodTypeGet url:UrlMain params:param success:^(id responseObject) {
        
        if(self.param != param) return;
        
        DebugLog(@"%@",responseObject);
//        self.maxtime = responseObject[@"info"][@"maxtime"];
        self.cmts = [MapleTopCmt mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        self.hotCmts = [MapleTopCmt mj_objectArrayWithKeyValuesArray:responseObject[@"hot"]];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *err) {
        if(self.param != param) return;
        [self.tableView.mj_header endRefreshing];
    }];
    
}

- (void)footerRefresh {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"a"] = @"dataList";
    param[@"c"] = @"comment";
    param[@"data_id"] = self.essence.ID;
    param[@"lastcid"] = self.cmts.lastObject.ID;
    self.param = param;
    
    [MapleAFHTTPTools requestWihtMethod:RequestMethodTypeGet url:UrlMain params:param success:^(id responseObject) {
        
        if(self.param != param) return;
        
        DebugLog(@"%@",responseObject);
        
        if([responseObject count] == 0){
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            self.tableView.mj_footer.hidden = YES;
            return;
        }
        //        self.maxtime = responseObject[@"info"][@"maxtime"];
        [self.cmts addObjectsFromArray:[MapleTopCmt mj_objectArrayWithKeyValuesArray:responseObject[@"data"]]];
        
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *err) {
        if(self.param != param) return;
        [self.tableView.mj_footer endRefreshing];
    }];
}


- (NSMutableArray<MapleTopCmt*>*)cmtInSelection:(NSInteger)section{
    if(self.hotCmts.count && section == 1) return self.hotCmts;
    if(self.cmts.count) return self.cmts;
    return nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(self.hotCmts.count) return 3;
    if(self.cmts.count) return 2;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) return 1;
    if([self cmtInSelection:section]) return [self cmtInSelection:section].count;
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MapleEssenceTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MPEssence];
        cell.essence = self.essence;
        return cell;
    }
    NSMutableArray<MapleTopCmt*>* cmts = [self cmtInSelection:indexPath.section];
    if (cmts) {
        MapleCommentTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MPComment];
        cell.cmt = cmts[indexPath.row];
        return cell;
    }

    return  nil;
}

#pragma  mark - UITableViewDelegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) return nil;
    if(self.hotCmts.count && section == 1) return @"最热评论";
    return @"最新评论";
}


//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *view = [[UIView alloc]init];
//    return view;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0)
        return self.essence.cellHeight;
    return UITableViewAutomaticDimension;
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
