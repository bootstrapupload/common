//
//  AreaController.m
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "AreaController.h"
#import "HNetwork+Address.h"
#import "HAreaModel.h"
@interface AreaController ()

@end

@implementation AreaController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView setFrame:self.view.bounds];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self onRefresh];
    // Do any additional setup after loading the view.
}

- (void)onLoad{
    if (self.type == 0) {
        [HNetwork getProviceList:^(NSInteger code, NSString *msg, NSArray * arr) {
            [self endRefrehing];
            [self.dataSet removeAllObjects];
            [self.dataSet addObjectsFromArray:arr];
            [self reLoadData];
        } failure:^(NSError *error) {
            [self endRefrehing];
            [MBProgressHUD showErrorMessage:error.domain];
        }];
    }else if (self.type == 1){
        [HNetwork getCityList:self.pCode.code success:^(NSInteger code, NSString *msg, NSArray * arr) {
            [self endRefrehing];
            
            [self.dataSet removeAllObjects];
            [self.dataSet addObjectsFromArray:arr];
            [self reLoadData];
            if (arr.count == 0) {
                if (self.EditBlock) {
                    self.EditBlock(self.pCode,nil, nil);
                }
                UIViewController *vc = [self.navigationController viewControllers][2];
                [self.navigationController popToViewController:vc animated:YES];
            }
        } failure:^(NSError *error) {
            [self endRefrehing];
            [MBProgressHUD showErrorMessage:error.domain];
        }];
    }else if (self.type == 2){
        [HNetwork getAreaList:self.cCode.code success:^(NSInteger code, NSString *msg, NSArray * arr) {
            [self endRefrehing];
            [self.dataSet removeAllObjects];
            [self.dataSet addObjectsFromArray:arr];
            if (arr.count == 0) {
                if (self.EditBlock) {
                    self.EditBlock(self.pCode,self.cCode, nil);
                }
                UIViewController *vc = [self.navigationController viewControllers][2];
                [self.navigationController popToViewController:vc animated:YES];
            }
            [self reLoadData];
        } failure:^(NSError *error) {
            [self endRefrehing];
            [MBProgressHUD showErrorMessage:error.domain];
        }];
    }
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
    
        HAreaModel *model = [self.dataSet objectAtIndex:indexPath.row];
        [UIUtil setSeparatorWithTableViewCell:cell];
        [UIUtil setSeparatorWithTableView:tableView];
        cell.textLabel.text = NSStringFormat(@"%ld.%@",indexPath.row + 1,model.name);
        cell.detailTextLabel.text = model.code;
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.type == 0) {
        HAreaModel *model = [self.dataSet objectAtIndex:indexPath.row];
        AreaController *avc = [[AreaController alloc] init];
        avc.type = 1;
        avc.pCode = model;
        avc.EditBlock = self.EditBlock;
        [self.navigationController pushViewController:avc animated:YES];
    }else if (self.type == 1) {
        HAreaModel *model = [self.dataSet objectAtIndex:indexPath.row];
        AreaController *avc = [[AreaController alloc] init];
        avc.type = 2;
        avc.pCode = self.pCode;
        avc.cCode = model;
        avc.EditBlock = self.EditBlock;
        [self.navigationController pushViewController:avc animated:YES];
    }else if (self.type == 2) {
        HAreaModel *model = [self.dataSet objectAtIndex:indexPath.row];
        if (self.EditBlock) {
            self.EditBlock(self.pCode, self.cCode, model);
        }
        UIViewController *vc = [self.navigationController viewControllers][2];
        [self.navigationController popToViewController:vc animated:YES];
    }
    
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
