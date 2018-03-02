//
//  RBCodeAutoSizeTableView.m
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/2/28.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "RBCodeAutoSizeTableView.h"
#import "RBTitleConstrant.h"
#import "RBAutoSizeTableViewCell.h"
#import "RBTitleModel.h"

@interface RBCodeAutoSizeTableView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray *titles;
@property (nonatomic, strong)NSDictionary *imageDict;
@property (nonatomic, strong)NSMutableArray *tempTitles;
@property (nonatomic, assign)NSUInteger maxCellIndex;
@end

@implementation RBCodeAutoSizeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    if(self){
        self.titles = [[NSMutableArray alloc] init];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark -
#pragma mark lazy load
- (void)setMaxCellIndex:(NSUInteger)maxCellIndex{
    
    _maxCellIndex = MAX(_maxCellIndex, maxCellIndex);
}


- (void)buildData{
    
    //    double allExTime = 0.0f;
    //    for(int i = 0; i < kRBCodeExcuteTimes; i ++){
    [self setupBaseData];
    [self convertDataToModel];
    [self estimateCellHeight];
    CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
    [self reloadData];
    CFAbsoluteTime excuteTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"代码自适应的加载时间 %f ms", (double)excuteTime*1000.0);
    //        allExTime += ((double)excuteTime*1000.0);
    //    }
    //    NSLog(@"代码自适应的平均加载时间 %f ms", allExTime/kRBCodeExcuteTimes);
}

- (void)convertDataToModel{
    
    [self.titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        RBTitleModel *titleModel = [[RBTitleModel alloc] init];
        titleModel.title = obj;
        titleModel.titleLabelHeight = 0.0f;
        [self.titles replaceObjectAtIndex:idx withObject:titleModel];
    }];
    self.tempTitles = [self.titles copy];
    self.titles = [[NSMutableArray alloc] init];
}

- (void)estimateCellHeight{
    
    CGFloat allHeight = 0.0;
    for(NSUInteger i = self.maxCellIndex; i < self.tempTitles.count; i++){
        RBTitleModel *model = self.tempTitles[i];
        [model calculateTitleWidth];
        allHeight += model.titleLabelHeight;
        [self.titles addObject:model];
        if(allHeight > self.frame.size.height*2) break;
        NSLog(@"%@", self.titles);
    }
}

- (void)caculateLabelHeightWithModel:(RBTitleModel *)model{
    
    [model calculateTitleWidth];
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

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *autoSizeTableViewCellID = @"RBAutoSizeTableViewCell";
    RBAutoSizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:autoSizeTableViewCellID];
    if(!cell){
        cell = [[RBAutoSizeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:autoSizeTableViewCellID];
    }
//    RBTitleModel *model = [self.titles objectAtIndex:indexPath.row];
//    [model calculateTitleWidth];
    [cell buildData:self.titles[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.maxCellIndex = indexPath.row + 1;
    if(self.titles.count <= self.maxCellIndex + 1){
        NSUInteger originTitleCount = self.titles.count;
        [self estimateCellHeight];
        NSUInteger currentTitleCount = self.titles.count;
        [self insertRowsAtIndexPaths:[self getIndexPathsWithOriginIndex:originTitleCount andCurrentIndex:currentTitleCount] withRowAnimation:UITableViewRowAnimationNone];
    }
}

- (NSArray *)getIndexPathsWithOriginIndex:(NSUInteger)originIndex andCurrentIndex:(NSUInteger)currentIndex{
    
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    for(NSUInteger i = originIndex; i < currentIndex; i++){
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [indexPaths addObject:indexPath];
    }
    return indexPaths;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RBTitleModel *model = [self.titles objectAtIndex:indexPath.row];
    return model.titleLabelHeight + 20.0*2;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
