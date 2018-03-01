//
//  RBAutoSizeTableViewCell.h
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/2/28.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBAutoSizeTableViewCell : UITableViewCell
- (void)buildData:(NSString *)title;
+ (CGFloat)calculateTitleWidth:(NSString *)title;
@end
