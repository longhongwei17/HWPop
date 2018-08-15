//
//  ViewController.m
//  HWPop
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "HWCustomPopView.h"

@interface ViewController ()

@end

@implementation ViewController

// master
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"我是测试";
    
    NSLog(@"我要提交一次");
}

// develop
- (IBAction)pop:(id)sender
{
    HWCustomPopView *popView = [[HWCustomPopView alloc] init];
    [popView showInLowWindowLevel];
//    __weak typeof(self) weakSelf = self;
//    [popView dismiss:^{
//        __strong typeof(self) strongSelf = weakSelf;
//        NSLog(@"calll===>%@",strongSelf.navigationItem.title);
//    }];
    
}

- (void)testDevelop
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    NSLog(@"dealloc====%s",__FUNCTION__);
}
@end
