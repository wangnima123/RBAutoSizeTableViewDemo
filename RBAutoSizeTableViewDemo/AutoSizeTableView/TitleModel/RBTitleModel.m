//
//  RBTitleModel.m
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/3/2.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "RBTitleModel.h"
#import "RBTitleConstrant.h"

@implementation RBTitleModel

- (void)calculateTitleWidth{
    
    if(self.titleLabelHeight > 0) return;
    
    CGFloat stringWidth = 0;
    CGSize size = CGSizeMake(kRBScreenWidth - 20.0f*2, MAXFLOAT);
    
    if (self.title.length > 0) {
#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
        stringWidth = [self.title
                       boundingRectWithSize:size
                       options:NSStringDrawingUsesLineFragmentOrigin
                       attributes:@{NSFontAttributeName:kRBTextFont}
                       context:nil].size.height;
#else
        //iOS7.0以下方法
        stringWidth = [self.title sizeWithFont:kRBTextFont
                        constrainedToSize:size
                            lineBreakMode:NSLineBreakByCharWrapping].height;
#endif
    }
    self.titleLabelHeight = stringWidth;
}

@end
