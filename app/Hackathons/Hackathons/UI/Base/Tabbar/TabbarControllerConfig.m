//
//  TabbarControllerConfig.m
//  FiveCent
//
//  Created by XuQuan on 07/06/2017.
//  Copyright © 2017 zhouxiangzhong. All rights reserved.
//

#import "TabbarControllerConfig.h"


#import "HomeViewController.h"
#import "MineViewController.h"
#import "DiscoveryViewController.h"
#import "MessageViewController.h"

@interface TabbarControllerConfig ()<UITabBarControllerDelegate, CYLTabBarControllerDelegate>
@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;
@end


@implementation TabbarControllerConfig

- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        UIOffset titlePositionAdjustment = UIOffsetZero;//UIOffsetMake(0, MAXFLOAT);
        
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                             imageInsets:imageInsets
                                                                                 titlePositionAdjustment:titlePositionAdjustment];
        tabBarController.delegate = self;
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (NSArray *)viewControllers {
    // First : Home
    HomeViewController *firstViewController = [[HomeViewController alloc] init];
    firstViewController.title = @"主页";
    UIViewController *firstNavigationController = [[RootNavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    firstNavigationController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5);
    
    // Second : Follow
    DiscoveryViewController *secondViewController = [[DiscoveryViewController alloc] init];
    secondViewController.title = @"发现";
    
    
    UIViewController *secondNavigationController = [[RootNavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    secondNavigationController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5);
    
//    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
//                                C6,
//                                NSForegroundColorAttributeName,
//                                F_PF_R_16,
//                                NSFontAttributeName,
//                                nil];
//    [secondViewController.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    
    // Third : Discovery
    MessageViewController *thirdViewController = [[MessageViewController alloc] init];
    thirdViewController.title = @"消息";
    UIViewController *thirdNavigationController = [[RootNavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    thirdNavigationController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5);
    
    
    // Fourth :PersonalCenter
    MineViewController *fourthViewController = [[MineViewController alloc] init];
//    fourthViewController.userId = [UserManager shareInstance].accountId;
    fourthViewController.title = @"我的";
    UIViewController *fourthNavigationController = [[RootNavigationController alloc]
                                                    initWithRootViewController:fourthViewController];
    fourthNavigationController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5);

    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"",  /* NSString and UIImage are supported*/
                                                 CYLTabBarItemSelectedImage : @"", /* NSString and UIImage are supported*/
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"发现",
                                                  CYLTabBarItemImage : @"",
                                                  CYLTabBarItemSelectedImage : @"",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"消息",
                                                 CYLTabBarItemImage : @"",
                                                 CYLTabBarItemSelectedImage : @"",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我的",
                                                  CYLTabBarItemImage : @"我的",
                                                  CYLTabBarItemSelectedImage : @"我的（选中）"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // Customize UITabBar height
    // 自定义 TabBar 高度
    tabBarController.tabBarHeight = 49.f;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = C11;
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = C6;
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    
//    tabBarController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -15);
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    UIView *animationView;
    NSString *button = [NSString stringWithFormat:@"UITabBarButton"];
    
    if ([control isKindOfClass:NSClassFromString(button)]) {
        NSString *imageView = [NSString stringWithFormat:@"UITabBarSwappableImageView"];
        for (UIView *subView in control.subviews) {
            if ([subView isKindOfClass:NSClassFromString(imageView)]) {
                animationView = subView;
            }
        }
    }
    
    [self addScaleAnimationOnView:animationView];
    
}

//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}


@end
