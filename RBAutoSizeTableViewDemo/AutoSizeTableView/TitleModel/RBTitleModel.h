//
//  RBTitleModel.h
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/3/2.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RBTitleModel : NSObject
@property (nonatomic, strong)NSString *title;
@property (nonatomic, assign)CGFloat titleLabelHeight;
- (void)calculateTitleWidth;
@end
