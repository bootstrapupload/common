//
//  LoginViewController.m
//  health
//
//  Created by XuQuan on 25/09/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "LoginViewController.h"
#import "GSShareManager.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *tfbg1;
@property (weak, nonatomic) IBOutlet UIView *tfbg2;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnReg;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;
@property (weak, nonatomic) IBOutlet UITextField *tfPwd;

@end

@implementation LoginViewController

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    CGRect rect = self . navigationController . navigationBar . frame ;
    self . navigationController . navigationBar . frame = CGRectMake ( rect . origin . x , rect . origin . y , rect . size . width , 64 ) ;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = C4;
    ViewBorderRadius(self.tfbg1, 1, 1, [UIColor lightGrayColor]);
    ViewBorderRadius(self.tfbg2, 1, 1, [UIColor lightGrayColor]);
    [self.btnLogin setTitleColor:C4 forState:UIControlStateNormal];
    [self.btnLogin setBackgroundImage:[UIImage imageWithColor:C6] forState:UIControlStateNormal];
    self.btnLogin.layer.shadowOffset = CGSizeMake(1, 1);
    self.btnLogin.layer.shadowOpacity = 0.8;
    self.btnLogin.layer.shadowColor = [UIColor blackColor].CGColor;
    // Do any additional setup after loading the view from its nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)toReg:(id)sender {
    
//    RegViewController *rvc = [[RegViewController alloc] init];
//    [self.navigationController pushViewController:rvc animated:YES];
    
}

- (IBAction)toLogin:(id)sender {
    

//
    
    KPostNotification(KNotificationLoginStateChange, @YES);
    return;
    if (![self.tfPhone.text isNotBlank]) {
        [MBProgressHUD showErrorMessage:@"请输入账号"];
        return;
    }
    if (![self.tfPwd.text isNotBlank]) {
        [MBProgressHUD showErrorMessage:@"请输入密码"];
        
        return;
    }
    
    
    [userManager login:kUserLoginTypePwd params:@{@"username":self.tfPhone.text,@"password":self.tfPwd.text} completion:^(BOOL success, NSString *des) {
        if (success) {
            KPostNotification(KNotificationLoginStateChange, @YES);
        }else{
            [MBProgressHUD showErrorMessage:des];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
