//
//  MapleTagRecommendViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/25.
//  Copyright © 2016年 mymaple. All rights reserved.
//




#import "MapleTagRecommendViewController.h"

#import <MJExtension/MJExtension.h>
#import <SVProgressHUD/SVProgressHUD.h>

#import "UITableViewController+MapleSwizzle.h"
#import "MapleAFHTTPTools.h"
#import "MapleTagRecommend.h"
#import "MapleTagRecommendTableViewCell.h"

static NSString* const MAPLETAG = @"tag";

@interface MapleTagRecommendViewController ()

/**
 *  table数据
 */
@property (nonatomic, strong) NSArray<MapleTagRecommend*> *tagRecommends;

@end

@implementation MapleTagRecommendViewController



//- (void)viewDidLoad {
//    [super viewDidLoad];
-(void)configView {
    //注册 cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MapleTagRecommendTableViewCell class]) bundle:nil] forCellReuseIdentifier:MAPLETAG];
    
    self.title = @"推荐标签";
    
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    NSMutableDictionary * param = [NSMutableDictionary dictionary];
    param[@"a"] = @"tag_recommend";
    param[@"action"] = @"sub";
    param[@"c"] =  @"topic";
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [MapleAFHTTPTools requestWihtMethod:RequestMethodTypeGet url:UrlMain params:param success:^(id responseObject) {
        self.tagRecommends = [MapleTagRecommend mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
        
    } failure:^(NSError *err) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tagRecommends.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MapleTagRecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MAPLETAG];
    
    cell.tagRecommend = self.tagRecommends[indexPath.row];
    
    return cell;
}



@end
