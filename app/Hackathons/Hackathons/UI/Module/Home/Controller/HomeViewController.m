//
//  HomeViewController.m
//  Hackathons
//
//  Created by XuQuan on 14/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "HomeViewController.h"
#import "HNetwork+Goods.h"
#import "AddressPage.h"
#import "HAddressModel.h"
#import "HomeCell.h"
#import "GoodsModel.h"
#import "CreateAddressViewController.h"
#import "GoodsDetailViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView setFrame:self.view.bounds];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:[HomeCell cellId]];
    [self onRefresh];
}

- (void)onLoad{
    
    [HNetwork groupInf:^(NSInteger code, NSString *msg, NSArray* obj) {
        [self endRefrehing];
        [self.dataSet removeAllObjects];
        [self.dataSet addObjectsFromArray:[obj mutableCopy]];
        [self reLoadData];
        [self setNoMoreData];
    } failure:^(NSError *error) {
        [self endRefrehing];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    return [[UIView alloc] init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomeCell cellId]];
    GoodsModel *model = self.dataSet[indexPath.row];
    [UIUtil setSeparatorWithTableViewCell:cell];
    [UIUtil setSeparatorWithTableView:tableView];
    [cell setDataInfo:model];
    cell.labelDetail.text = NSStringFormat(@"%ld",indexPath.row +1 );
    return cell;
#pragma --- 接口
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //
    //    HAddressModel *model = [self.dataSet objectAtIndex:indexPath.row];
    //    [UIUtil setSeparatorWithTableViewCell:cell];
    //    [UIUtil setSeparatorWithTableView:tableView];
    //    cell.textLabel.text = NSStringFormat(@"%ld.%@",indexPath.row + 1,model.name);
    //    cell.detailTextLabel.text = model.code;
    //    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GoodsModel *model = self.dataSet[indexPath.row];
    GoodsDetailViewController *gvc = [[GoodsDetailViewController alloc] init];
    gvc.goodsModel = model;
    [self.navigationController pushViewController:gvc animated:YES];
    

    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [HomeCell height];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    return self.dataSet.count;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

@end

