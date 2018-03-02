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
    [self convertDataToModel];
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
}

- (void)setupBaseData{
    
    self.titles = [[NSMutableArray alloc] init];
    NSInteger wholeTitleLength = RBTitle.length;
    for(int i = 0; i < kRBCellNumbers; i++){
        
        [self.titles addObject:[RBTitle substringToIndex:arc4random()%(wholeTitleLength+1)]];
    }
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
    //动态计算当前cell的高度
    RBTitleModel *titleModel = [self.titles objectAtIndex:indexPath.row];
    [titleModel calculateTitleWidth];
    
    [cell buildData:self.titles[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
