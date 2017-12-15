//
//  ShareViewController.m
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "ShareViewController.h"
#import <LBXScanNative.h>
@interface ShareViewController ()
@property (weak, nonatomic) IBOutlet UILabel *goodName;
@property (weak, nonatomic) IBOutlet UILabel *goodRequire;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"集货助手";
    self.goodName.text = self.goodModel.groupName;
    self.goodRequire.text = NSStringFormat(@"全国流向%ld-%ldkg|每日最低需寄%ld件",self.goodModel.weightMin/1000,self.goodModel.weightMax/1000,self.goodModel.dailyMinPackage);
    self.img.image = [LBXScanNative createQRWithString:[self.goodModel modelToJSONString] QRSize:self.img.bounds.size QRColor:[UIColor blueColor] bkColor:[UIColor redColor]];
    [self.btnSave setBackgroundImage:[UIImage imageWithColor:C6] forState:UIControlStateNormal];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)save:(id)sender {
    UIImageWriteToSavedPhotosAlbum([self snapshotSingleView:self.img.superview], self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
    NSString*message =@"提示";
    
    message =@"成功保存到相册";
    [MBProgressHUD showInfoMessage:message];
}
- (void)imageSavedToPhotosAlbum:(UIImage*)image didFinishSavingWithError:  (NSError*)error contextInfo:(id)contextInfo{
    
    
}
/**
 *  某个View单独进行截图
 */
- (UIImage *)snapshotSingleView:(UIView *)view
{
    CGRect rect =  view.frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
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
