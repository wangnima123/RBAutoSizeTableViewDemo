//
//  RBNibAutoSizeTableView.m
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/3/1.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "RBNibAutoSizeTableView.h"
#import "RBTitleConstrant.h"
#import "RBAutoSizeTableViewCell2.h"

@interface RBNibAutoSizeTableView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray *titles;
@end

@implementation RBNibAutoSizeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    self.titles = [[NSMutableArray alloc] init];
    self.estimatedRowHeight = 300.0f;
    self.rowHeight = UITableViewAutomaticDimension;
    self.delegate = self;
    self.dataSource = self;
}

- (void)setupBaseData{
    
    self.titles = [[NSMutableArray alloc] init];
    NSArray *unitList = [RBTitleConstrant getTitleUnitList];
    NSUInteger i = kRBCellNumbers/[unitList count];
    NSUInteger j = kRBCellNumbers%[unitList count];
    for(int k = 0; k < i; k++){
        
        [self.titles addObjectsFromArray:[RBTitleConstrant getTitleUnitList]];
    }
    [self.titles addObjectsFromArray:[unitList subarrayWithRange:NSMakeRange(0, j)]];
}

- (void)buildData{
    
    //    double allExTime = 0.0f;
    //    for(int i = 0; i < kRBCodeExcuteTimes; i ++){
    [self setupBaseData];
    CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
    [self reloadData];
    CFAbsoluteTime excuteTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"Nib+约束自适应的加载时间 %f ms", (double)excuteTime*1000.0);
    //        allExTime += ((double)excuteTime*1000.0);
    //    }
    //    NSLog(@"Nib+约束自适应的平均加载时间 %f ms", allExTime/kRBCodeExcuteTimes);
}

#pragma mark -
#pragma mark UITableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"RBAutoSizeTableViewCell1";
    RBAutoSizeTableViewCell2 *autoSizeTableViewCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!autoSizeTableViewCell){
        autoSizeTableViewCell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([RBAutoSizeTableViewCell2 class]) owner:self options:nil].lastObject;
    }
    [autoSizeTableViewCell buildData:self.titles[indexPath.row]];
    return autoSizeTableViewCell;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
