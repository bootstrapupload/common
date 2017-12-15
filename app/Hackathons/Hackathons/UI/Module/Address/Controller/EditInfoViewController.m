//
//  EditInfoViewController.m
//  health
//
//  Created by XuQuan on 30/09/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "EditInfoViewController.h"

@interface EditInfoViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfEditor;
@property (nonatomic, retain) UIButton *rightBtn;
@end

@implementation EditInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.type == 1) {
        self.title = @"编辑地址";
    }else if (self.type == 2){
        self.title = @"编辑姓名";
        
    }else if (self.type == 3){
        self.tfEditor.keyboardType = UIKeyboardTypePhonePad;
        self.title = @"编辑手机";
    }else
    if (self.type == 4  ) {
        self.tfEditor.keyboardType = UIKeyboardTypeNumberPad;
        self.title = @"填写数量";
    }else
        if (self.type == 5){
            self.tfEditor.keyboardType = UIKeyboardTypeNumberPad;
            self.title = @"填写平均重量";
            self.tfEditor.placeholder = @"单位：kg";
        }
    self.tfEditor.text = self.str;
    self.tfEditor.delegate = self;
    
    [self addNavigationRightItem:@"完成" image:nil target:self action:@selector(onComplete)];
    
    _rightBtn = self.navigationItem.rightBarButtonItem.customView;
//    if (self.tfEditor.text.length == 0) {
//        if (_rightBtn) {
//            _rightBtn.enabled = NO;
//        }
//    }else{
//        if (_rightBtn) {
//            _rightBtn.enabled = YES;
//        }
//    }
    self.view.backgroundColor = [UIColor colorWithRed:243.f/255 green:247.f/255 blue:252.f/255 alpha:1];
}

- (void)onComplete{
    if (_EditBlock) {
        _EditBlock(self.tfEditor.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
//    if (textField.text.length == 0) {
//        if (_rightBtn) {
//            _rightBtn.enabled = NO;
//        }
//    }else{
//        if (_rightBtn) {
//            _rightBtn.enabled = YES;
//        }
//    }
    
    return YES;
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
