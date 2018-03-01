//
//  ViewController3.m
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/3/1.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "ViewController3.h"
#import "RBNibAutoSizeTableView.h"
#import "RBTitleConstrant.h"

@interface ViewController3 ()
@property (nonatomic, strong)RBNibAutoSizeTableView *tableV;
@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self.tableV buildData];
}

- (void)buildUI{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableV = [[RBNibAutoSizeTableView alloc] initWithFrame:CGRectMake(0.0f, 64.0f, kRBScreenWidth, kRBScreenHeight - 64.0f) style:UITableViewStylePlain];
    [self.view addSubview:self.tableV];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
