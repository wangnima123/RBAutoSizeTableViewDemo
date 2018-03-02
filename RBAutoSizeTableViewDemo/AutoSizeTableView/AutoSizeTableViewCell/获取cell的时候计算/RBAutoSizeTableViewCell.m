//
//  RBAutoSizeTableViewCell.m
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/2/28.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "RBAutoSizeTableViewCell.h"
#import "RBTitleConstrant.h"
#import "RBTitleModel.h"

@interface RBAutoSizeTableViewCell()
@property (nonatomic, strong)UILabel *titleLabel;
@end

@implementation RBAutoSizeTableViewCell

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
    self.titleLabel.frame = CGRectMake(20.0f, 20.0f, kRBScreenWidth - 20.0f*2, 0.0f);
}

- (void)buildData:(RBTitleModel *)titleModel{
    
    self.titleLabel.text = titleModel.title;
    self.titleLabel.frame = CGRectMake(20.0f, 20.0f, kRBScreenWidth - 20.0f*2, titleModel.titleLabelHeight);
}

@end
