//
//  ViewController.m
//  ZJJTextFieldHandle
//
//  Created by xtayqria on 2016/09/18.
//  Copyright © 2016年 xtayqria. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"root";
    [self creatButton];
}

- (void)creatButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, 100, 100, 50);
    [btn setTitle:@"root" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goFirst) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)goFirst {
    NextViewController *next = [[NextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
