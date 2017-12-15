//
//  GoodsDetailViewController.m
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "GoodsDetailViewController.h"
#import "YLProgressBar.h"
#import "GoodsModel.h"
#import "GoodsInfoView.h"
#import "GSShareManager.h"
#import "CreateAddressViewController.h"
@interface GoodsDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *goodTitle;
@property (weak, nonatomic) IBOutlet UILabel *goodRequire;
@property (weak, nonatomic) IBOutlet UIImageView *goodImg;
@property (weak, nonatomic) IBOutlet YLProgressBar *goodProgress;
@property (weak, nonatomic) IBOutlet UILabel *goodLeftNum;
@property (weak, nonatomic) IBOutlet UILabel *goodDate;
@property (weak, nonatomic) IBOutlet UILabel *goodUseRequire;
@property (weak, nonatomic) IBOutlet UIButton *btnPartin;
@property (weak, nonatomic) IBOutlet UIButton *btnShare;
@property (strong, nonatomic) GoodsInfoView *goodInfoView;

@end

@implementation GoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"集货详情";
    self.goodTitle.text = self.goodsModel.groupName;
    self.goodRequire.text = NSStringFormat(@"%ld-%ldkg每日最低需寄%ld件",self.goodsModel.weightMin/1000,self.goodsModel.weightMax/1000,self.goodsModel.dailyMinPackage);
    self.goodInfoView.label1.text = NSStringFormat(@"低至￥%ld元",self.goodsModel.basePrice/100);
    self.goodInfoView.label2.text =NSStringFormat(@"%ldkg",self.goodsModel.weightMin/1000);
    self.goodInfoView.frame = CGRectMake(SCREEN_WIDTH - 120, 40, 90, 100);
    
    self.goodLeftNum.text = NSStringFormat(@"还差%ld人即可成团" ,self.goodsModel.groupLimit - self.goodsModel.groupCount);
    self.goodDate.text = NSStringFormat(@"截止日期：%@",self.goodsModel.groupEndTime);
    self.goodUseRequire.preferredMaxLayoutWidth = SCREEN_WIDTH - 20;
//    self.goodUseRequire.text  = self.goodsModel.groupRule;
    
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[self.goodsModel.groupRule dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    self.goodUseRequire.attributedText = attrStr;
    [self.goodImg setImageWithURL:kImgNormalUrl(self.goodsModel.advImg) placeholder:kPlaceholder];
    [self.btnPartin setBackgroundImage:[UIImage imageWithColor:C6] forState:UIControlStateNormal];
    [self.btnPartin setTitle:@"报名集货" forState:UIControlStateNormal];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickPartin:(id)sender {
        CreateAddressViewController *avc = [[CreateAddressViewController alloc] init];
    avc.groupId = self.goodsModel.ID;
    avc.goodsModel = self.goodsModel;
        [self.navigationController pushViewController:avc animated:YES];
}

- (IBAction)clickShare:(id)sender {
        NSString *shareUrlStr = [[NSString alloc] initWithFormat:@"http://www.baidu.com/dapei/share?id=%ld", 11];
        BOOL isFriends = YES;
        id<GSShareProtocol> share = nil;
        if (isFriends) {
            share = [[GSShareManager share] getShareProtocolWithChannelType: [GSShareManager getShareChannelTypeWithLogoReourcesType:GSLogoReourcesTypeWechatSession]];
        } else {
            share = [[GSShareManager share] getShareProtocolWithChannelType: [GSShareManager getShareChannelTypeWithLogoReourcesType:GSLogoReourcesTypeWechatTimeLine]];
        }
    
        [share setShareCompletionBlock:^(id<GSShareResultProtocol> result) {
    
        }];
    
        UIImage *appIcon = [UIImage imageNamed: [[[[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIcons"] objectForKey:@"CFBundlePrimaryIcon"] objectForKey:@"CFBundleIconFiles"]  objectAtIndex:0]];
        [share shareURL: shareUrlStr title:@"我在「集货助手」上发现了好东西" description:@"分享给你一个好集货" thumbnail:appIcon];
    
    
}



- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.goodProgress.type                     = YLProgressBarTypeFlat;
    self.goodProgress.indicatorTextDisplayMode = YLProgressBarIndicatorTextDisplayModeTrack;
//    self.goodProgress.behavior                 = YLProgressBarBehaviorIndeterminate;
//    self.goodProgress.stripesOrientation       = YLProgressBarStripesOrientationVertical;
    [self.goodProgress setProgress:self.goodsModel.groupCount*1.f/self.goodsModel.groupLimit*1.f animated:YES];
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

- (GoodsInfoView *)goodInfoView{
    if (!_goodInfoView) {
        _goodInfoView = [[GoodsInfoView alloc] init];
        _goodInfoView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_goodInfoView];
    }
    return  _goodInfoView;
}

@end
