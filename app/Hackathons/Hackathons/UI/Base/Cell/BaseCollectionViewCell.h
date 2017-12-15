//
//  BaseCollectionViewCell.h
//  xqzg
//
//  Created by 维农 on 16/1/6.
//  Copyright © 2016年 维农-shitou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionViewCell : UICollectionViewCell
+ (CGFloat)height;
+ (CGSize)cellSize;
+ (NSString *) cellId;
- (void )addInfoWith:(NSObject *)obj;
@end
