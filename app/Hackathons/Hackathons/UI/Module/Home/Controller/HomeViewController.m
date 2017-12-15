//
//  HomeViewController.m
//  Hackathons
//
//  Created by XuQuan on 14/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "HomeViewController.h"
#import "HNetwork+Address.h"
#import "AddressPage.h"
#import "HAddressModel.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView setFrame:self.view.bounds];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self onRefresh];
}

- (void)onLoad{
    [HNetwork requestPage:currPage success:^(NSInteger code, NSString *msg, AddressPage * obj) {
        NSLog(@"%@",obj);
        [self endRefrehing];
        if (obj.current == 1) {
            [self.dataSet removeAllObjects];
        }
        [self.dataSet addObjectsFromArray:[obj.records mutableCopy]];
        [self reLoadData];
        if (currPage>=obj.pages) {
            [self setNoMoreData];
        }
    } failure:^(NSError *error) {
        [self endRefrehing];
        [self setNoMoreData];
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    HAddressModel *model = [self.dataSet objectAtIndex:indexPath.row];
    [UIUtil setSeparatorWithTableViewCell:cell];
    [UIUtil setSeparatorWithTableView:tableView];
    cell.textLabel.text = NSStringFormat(@"%ld.%@",indexPath.row + 1,model.name);
    cell.detailTextLabel.text = model.code;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [MBProgressHUD showSuccessMessage:@"操作成功"];
    return;
    
    HAddressModel *model = [self.dataSet objectAtIndex:indexPath.row];
    [model setName:NSStringFormat(@"%@1",model.name)];
    [HNetwork updateAddress:model success:^(NSInteger code, NSString *msg, id obj) {
        if (code == 1) {
            
            [tableView reloadRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    } failure:^(NSError *error) {
        
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSet.count;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

@end
