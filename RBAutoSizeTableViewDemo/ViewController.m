//
//  ViewController.m
//  RBAutoSizeTableViewDemo
//
//  Created by wangze on 2018/2/28.
//  Copyright © 2018年 wangze. All rights reserved.
//

#import "ViewController.h"
#import "RBCodeAutoSizeTableView.h"
#import "RBCodeAutoSizeTableView.h"
#import "RBConstraintAutoSizeTableView.h"
#import "RBTitleConstrant.h"

@interface ViewController ()
@property (nonatomic, strong)RBCodeAutoSizeTableView *tableV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self buildUI];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self.tableV buildData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildUI{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableV = [[RBCodeAutoSizeTableView alloc] initWithFrame:CGRectMake(0.0f, 64.0f, kRBScreenWidth, kRBScreenHeight - 64.0f) style:UITableViewStylePlain];
    [self.view addSubview:self.tableV];
}

@end
