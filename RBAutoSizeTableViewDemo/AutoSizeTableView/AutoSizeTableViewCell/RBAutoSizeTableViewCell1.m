//
//  RBAutoSizeTableViewCell1.m
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/3/1.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "RBAutoSizeTableViewCell1.h"
#import "RBTitleConstrant.h"
#import "Masonry.h"

@interface RBAutoSizeTableViewCell1()
@property (nonatomic, strong)UILabel *titleLabel;
@end

@implementation RBAutoSizeTableViewCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.font = kRBTextFont;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.contentView).with.mas_offset(20.0f);
        make.bottom.right.mas_equalTo(self.contentView).with.mas_offset(-20.0f);
    }];
}

- (void)buildData:(NSString *)title{
    
    self.titleLabel.text = title;
}

@end
