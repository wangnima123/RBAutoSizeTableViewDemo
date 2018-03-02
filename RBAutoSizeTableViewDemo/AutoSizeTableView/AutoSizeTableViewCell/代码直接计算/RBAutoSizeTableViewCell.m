//
//  RBAutoSizeTableViewCell.m
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/2/28.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "RBAutoSizeTableViewCell.h"
#import "RBTitleConstrant.h"

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

- (void)buildData:(NSString *)title{
    
    self.titleLabel.text = title;
    self.titleLabel.frame = CGRectMake(20.0f, 20.0f, kRBScreenWidth - 20.0f*2, [RBAutoSizeTableViewCell calculateTitleWidth:title]);
}

+ (CGFloat)calculateTitleWidth:(NSString *)title{
    
    CGFloat stringWidth = 0;
    CGSize size = CGSizeMake(kRBScreenWidth - 20.0f*2, MAXFLOAT);
    
    if (title.length > 0) {
#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
        stringWidth = [title
                      boundingRectWithSize:size
                      options:NSStringDrawingUsesLineFragmentOrigin
                      attributes:@{NSFontAttributeName:kRBTextFont}
                      context:nil].size.height;
#else
        //iOS7.0以下方法
        stringWidth = [title sizeWithFont:kRBTextFont
                            constrainedToSize:size
                                lineBreakMode:NSLineBreakByCharWrapping].height;
#endif
    }
    return stringWidth;
}

@end
