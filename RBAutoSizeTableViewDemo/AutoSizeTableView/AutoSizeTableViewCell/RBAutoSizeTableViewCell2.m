//
//  RBAutoSizeTableViewCell2.m
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/3/1.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "RBAutoSizeTableViewCell2.h"

@interface RBAutoSizeTableViewCell2()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation RBAutoSizeTableViewCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)buildData:(NSString *)title{
    
    self.titleLabel.text = title;
}

@end
