//
//  RBTitleConstrant.h
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/2/28.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import <Foundation/Foundation.h>

//Cell个数
#define kRBCellNumbers     10000
//统计样本总量
#define kRBCodeExcuteTimes 1000
#define kRBScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kRBScreenHeight [UIScreen mainScreen].bounds.size.height
#define kRBTextFont     [UIFont systemFontOfSize:14.0f]

@interface RBTitleConstrant : NSObject
extern NSString const* RBTitle;
+ (NSArray *)getTitleUnitList;
@end
