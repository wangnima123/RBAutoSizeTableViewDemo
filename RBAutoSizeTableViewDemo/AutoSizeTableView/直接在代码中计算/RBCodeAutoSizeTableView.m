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

@interface RBCodeAutoSizeTableView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray *titles;
@property (nonatomic, strong)NSDictionary *imageDict;
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

- (void)buildData{
    
//    double allExTime = 0.0f;
//    for(int i = 0; i < kRBCodeExcuteTimes; i ++){
        [self setupBaseData];
        CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
        [self reloadData];
        CFAbsoluteTime excuteTime = (CFAbsoluteTimeGetCurrent() - startTime);
        NSLog(@"代码自适应的加载时间 %f ms", (double)excuteTime*1000.0);
//        allExTime += ((double)excuteTime*1000.0);
//    }
//    NSLog(@"代码自适应的平均加载时间 %f ms", allExTime/kRBCodeExcuteTimes);
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
    [cell buildData:self.titles[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [RBAutoSizeTableViewCell calculateTitleWidth:self.titles[indexPath.row]] + 20.0*2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
