//
//  CreateAddressViewController.m
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "CreateAddressViewController.h"
#import "HAddressCell.h"
#import "SimpleCell.h"
#import "NumGoodsCell.h"
#import "AreaController.h"
#import "HGoodsModel.h"
#import "EditInfoViewController.h"
#import "HAreaModel.h"
#import "HNetwork+Goods.h"
#import "ShareViewController.h"

@interface CreateAddressViewController ()
@property (nonatomic, strong) HGoodsModel *goodModel;

@property (nonatomic ,strong) HAreaModel *pModel;
@property (nonatomic ,strong) HAreaModel *cModel;
@property (nonatomic ,strong) HAreaModel *aModel;

@property (nonatomic, strong) UIButton *btnGroup;

@end

@implementation CreateAddressViewController
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView setFrame:self.view.bounds];
    self.btnGroup.bottom = self.tableView.bottom;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.mj_footer = nil;
    self.tableView.mj_header = nil;
    self.title = @"填写寄件信息";
    [self.tableView registerNib:[UINib nibWithNibName:@"HAddressCell" bundle:nil] forCellReuseIdentifier:[HAddressCell cellId]];
    [self.tableView registerNib:[UINib nibWithNibName:@"NumGoodsCell" bundle:nil] forCellReuseIdentifier:[NumGoodsCell cellId]];
    [self.tableView registerNib:[UINib nibWithNibName:@"SimpleCell" bundle:nil] forCellReuseIdentifier:[SimpleCell cellId]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.width, 44)];
    view.backgroundColor = [UIColor whiteColor];
    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(15, 12, 20, 20)];
    [left setContentMode:UIViewContentModeScaleAspectFit];
    //    left.backgroundColor = [UIColor colorWithRed:97.f/255 green:176.f/255 blue:189.f/255 alpha:1];
    
    [view addSubview:left];
    UILabel *title =[[UILabel alloc] initWithFrame:CGRectMake(left.right + 8, 4, 120, 36)];
    title.textColor = C6;
    [view addSubview:title];
    title.font = F2;
    if (section == 0) {
        title.text = @"寄件地址";
        left.image = [UIImage imageNamed:@"地址"];
        
    }else{
        title.text = @"寄件人";
        left.image = [UIImage imageNamed:@"人"];
    }
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, tableView.width, .5f)];
    line.backgroundColor = [UIColor colorWithRed:243.f/255 green:247.f/255 blue:252.f/255 alpha:1];
    [view addSubview:line];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:[HAddressCell cellId]];
        [UIUtil setSeparatorWithTableViewCell:cell];
        [UIUtil setSeparatorWithTableView:tableView];
        cell.name.text = NSStringFormat(@"%ld",indexPath.row +1 );
        if (indexPath.row == 0) {
            cell.name.text = @"所在地区";
            cell.detail.text = @"";
        }else if (indexPath.row == 1){
            if ([self.goodModel.address isNotBlank]) {
                cell.name.text = self.goodModel.address;
            }else{
                cell.name.text = @"请填写详细地址，不少于5个字";
            }
            
            cell.detail.hidden = YES;
            //            [cell setAccessoryType:UITableViewCellAccessoryNone]
        }
        return cell;
        
    }
    if (indexPath.section == 1 ) {
        
        if ( indexPath.row == 2) {
            NumGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:[NumGoodsCell cellId]];
            [UIUtil setSeparatorWithTableViewCell:cell];
            [UIUtil setSeparatorWithTableView:tableView];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return cell;
        }
        
    }
    
    SimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:[SimpleCell cellId]];
    [UIUtil setSeparatorWithTableViewCell:cell];
    [UIUtil setSeparatorWithTableView:tableView];
    if (indexPath.row == 0) {
        if ([self.goodModel.senderName isNotBlank]) {
            cell.name.text = self.goodModel.senderName;
        }else{
            cell.name.text = @"请填写寄件人姓名";
        }
    }else if(indexPath.row == 1){
        if ([self.goodModel.senderPhone isNotBlank]) {
            cell.name.text = self.goodModel.senderPhone;
        }else{
            cell.name.text = @"请填写寄件人电话";
        }
    }else if(indexPath.row == 3){
        if (self.goodModel.avgCount) {
            cell.name.text = NSStringFormat(@"%ld",self.goodModel.avgCount);
        }else{
            cell.name.text = @"请填写寄件数量（至少20件）";
        }
    }else if(indexPath.row == 4){
        if (self.goodModel.avgWeight) {
            cell.name.text = NSStringFormat(@"%ld",self.goodModel.avgWeight/1000);
        }else{
            cell.name.text = @"请选择单件平均重量";
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            AreaController *avc = [[AreaController alloc] init];
            avc.type = 0;
            [avc setEditBlock:^(HAreaModel *pM, HAreaModel *cM, HAreaModel *aM) {
                if (pM) {
                    self.pModel = [[HAreaModel alloc] init];
                    self.pModel.name = pM.name;
                    self.pModel.code = pM.code;
                }
                if (cM) {
                    self.cModel = [[HAreaModel alloc] init];
                    self.cModel.name = cM.name;
                    self.cModel.code = cM.code;
                }else{
                    self.cModel = self.pModel;
                }
                
                if (aM) {
                    self.aModel = [[HAreaModel alloc] init];
                    self.aModel.name = aM.name;
                    self.aModel.code = aM.code;
                }else{
                    self.aModel = self.cModel;
                }
                HAddressCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                if ([self.cModel.code isEqualToString:self.pModel.code]) {
                    cell.detail.text = NSStringFormat(@"%@",self.pModel.name);
                }else if ([self.aModel.code isEqualToString:self.cModel.code]) {
                    cell.detail.text = NSStringFormat(@"%@%@",self.pModel.name,self.cModel.name);
                }else if ([self.pModel.code isEqualToString:self.cModel.code]&&(![self.cModel.code isEqualToString:self.aModel.code])) {
                    cell.detail.text = NSStringFormat(@"%@%@",self.pModel.name,self.aModel.name);
                } else{
                    cell.detail.text = NSStringFormat(@"%@%@%@",self.pModel.name,self.cModel.name,self.aModel.name);
                }
                
                
            }];
            [self.navigationController pushViewController:avc animated:YES];
        }else if (indexPath.row == 1){
            EditInfoViewController *evc = [[EditInfoViewController alloc] init];
            evc.type = 1;
            evc.str = self.goodModel.address;
            [evc setEditBlock:^(NSString *content) {
                SimpleCell *cell = (SimpleCell *)[tableView cellForRowAtIndexPath:indexPath];
                self.goodModel.address = content;
                cell.name.text = content;
            }];
            [self.navigationController pushViewController:evc animated:YES];
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            EditInfoViewController *evc = [[EditInfoViewController alloc] init];
            evc.type = 2;
            evc.str = self.goodModel.senderPhone;
            [evc setEditBlock:^(NSString *content) {
                SimpleCell *cell = (SimpleCell *)[tableView cellForRowAtIndexPath:indexPath];
                self.goodModel.senderName = content;
                cell.name.text = content;
            }];
            [self.navigationController pushViewController:evc animated:YES];
        }else if (indexPath.row == 1){
            EditInfoViewController *evc = [[EditInfoViewController alloc] init];
            evc.type = 3;
            evc.str = self.goodModel.senderPhone;
            [evc setEditBlock:^(NSString *content) {
                SimpleCell *cell = (SimpleCell *)[tableView cellForRowAtIndexPath:indexPath];
                self.goodModel.senderPhone = content;
                cell.name.text = content;
            }];
            [self.navigationController pushViewController:evc animated:YES];
        }else if (indexPath.row == 3){
            EditInfoViewController *evc = [[EditInfoViewController alloc] init];
            evc.type = 4;
            evc.str = NSStringFormat(@"%ld",self.goodModel.avgCount);
            [evc setEditBlock:^(NSString *content) {
                SimpleCell *cell = (SimpleCell *)[tableView cellForRowAtIndexPath:indexPath];
                self.goodModel.avgCount = [content integerValue];
                cell.name.text = NSStringFormat(@"%ld",self.goodModel.avgCount);
                cell.name.text = content;
            }];
            [self.navigationController pushViewController:evc animated:YES];
        }else if (indexPath.row == 4){
            EditInfoViewController *evc = [[EditInfoViewController alloc] init];
            evc.type = 5;
            evc.str = NSStringFormat(@"%ld",self.goodModel.avgWeight/1000);
            [evc setEditBlock:^(NSString *content) {
                SimpleCell *cell = (SimpleCell *)[tableView cellForRowAtIndexPath:indexPath];
                self.goodModel.avgWeight = [content integerValue]*1000;
                cell.name.text = NSStringFormat(@"%ld",self.goodModel.avgWeight/1000);
            }];
            [self.navigationController pushViewController:evc animated:YES];
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return [HAddressCell height];
    }
    return [SimpleCell height];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 2;
    }
    return 5;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (void)click{
    self.goodModel.provinceCode = self.pModel.code;
    self.goodModel.cityCode = self.cModel.code;
    self.goodModel.areaCode = self.aModel.code;
    
    if (![self.goodModel.provinceCode isNotBlank]) {
        [MBProgressHUD showInfoMessage:@"请选择省"];
        return;
    }
    if (![self.goodModel.cityCode isNotBlank]) {
        [MBProgressHUD showInfoMessage:@"请选择市"];
        return;
    }
    if (![self.goodModel.areaCode isNotBlank]) {
        [MBProgressHUD showInfoMessage:@"请选择区"];
        return;
    }
    if (![self.goodModel.senderName isNotBlank]) {
        [MBProgressHUD showInfoMessage:@"请输入寄件人姓名"];
        return;
    }
    if (![self.goodModel.senderName isNotBlank]) {
        [MBProgressHUD showInfoMessage:@"请输入寄件人电话"];
        return;
    }
    if (!self.goodModel.avgCount) {
        [MBProgressHUD showInfoMessage:@"请输入寄件数量"];
        return;
    }
    if (self.goodModel.avgCount < 20) {
        [MBProgressHUD showInfoMessage:@"请输入寄件数量大于20"];
        return;
    }
    if (!self.goodModel.avgWeight) {
        [MBProgressHUD showInfoMessage:@"请输入寄件平均重量"];
        return;
    }
    
    [HNetwork groupJoinInfo:self.goodModel success:^(NSInteger code, NSString *msg, id obj) {
        ShareViewController *svc = [[ShareViewController alloc] init];
        [self.navigationController pushViewController:svc animated:YES];
    } failure:^(NSError *error) {
        
    }];
    
}

- (HGoodsModel *)goodModel{
    if (!_goodModel) {
        _goodModel = [[HGoodsModel alloc] init];
    }
    return _goodModel;
}

- (UIButton *)btnGroup {
    if (!_btnGroup) {
        _btnGroup = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        [_btnGroup setBackgroundImage:[UIImage imageWithColor:C6] forState:UIControlStateNormal];
        [_btnGroup setTitle:@"报名集货" forState:UIControlStateNormal];
        [_btnGroup addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btnGroup];
    }
    return _btnGroup;
}


@end

