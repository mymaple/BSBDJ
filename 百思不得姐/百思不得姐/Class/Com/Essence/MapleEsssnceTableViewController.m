//
//  MapleEsssnceTableViewController.m
//  百思不得姐
//
//  Created by mymaple on 16/9/29.
//  Copyright © 2016年 mymaple. All rights reserved.
//

#import "MapleEsssnceTableViewController.h"
#import "UITableViewController+MapleSwizzle.h"
#import "MapleAFHTTPTools.h"

@interface MapleEsssnceTableViewController ()

@end

@implementation MapleEsssnceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadData];
}


#pragma  mark - loadData
- (void)loadData {
    
}






#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell%zd----%zd",self.essenceType,indexPath.row];
    return cell;
}

/**
 *  状态栏隐藏
 */
//-(BOOL)prefersStatusBarHidden {
//    return YES;
//}

@end
