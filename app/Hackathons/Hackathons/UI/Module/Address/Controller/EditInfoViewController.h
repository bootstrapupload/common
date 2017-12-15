//
//  EditInfoViewController.h
//  health
//
//  Created by XuQuan on 30/09/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "RootViewController.h"

@interface EditInfoViewController : RootViewController
@property (nonatomic, assign) int type;
@property (nonatomic, copy) NSString *str;
@property (nonatomic, copy) void(^EditBlock)(NSString *content);
@end
