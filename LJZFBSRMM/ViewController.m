//
//  ViewController.m
//  LJZFBSRMM
//
//  Created by liujunjie on 15-7-7.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import "ViewController.h"
#import "LJTradeView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)zhifu:(UIButton *)sender {
    LJTradeView *tradeView = [[LJTradeView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tradeView];
    [tradeView show];
}

@end
