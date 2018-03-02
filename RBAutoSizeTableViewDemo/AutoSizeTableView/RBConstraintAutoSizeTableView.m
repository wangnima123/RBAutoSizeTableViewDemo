//
//  RBConstraintAutoSizeTableView.m
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/2/28.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "RBConstraintAutoSizeTableView.h"
#import "RBTitleConstrant.h"
#import "RBAutoSizeTableViewCell1.h"

@interface RBConstraintAutoSizeTableView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray *titles;
@end

@implementation RBConstraintAutoSizeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    self.titles = [[NSMutableArray alloc] init];
    self.estimatedRowHeight = 300.0f;  //设置近似值
    NSLog(@"%f", kRBScreenWidth);
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
    NSLog(@"约束自适应的加载时间 %f ms", (double)excuteTime*1000.0);
    //        allExTime += ((double)excuteTime*1000.0);
    //    }
    //    NSLog(@"约束自适应的平均加载时间 %f ms", allExTime/kRBCodeExcuteTimes);
}

#pragma mark -
#pragma mark UITableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"RBAutoSizeTableViewCell1";
    RBAutoSizeTableViewCell1 *autoSizeTableViewCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!autoSizeTableViewCell){
        autoSizeTableViewCell = [[RBAutoSizeTableViewCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
