//
//  ViewController.m
//  ZJJTextFieldHandle
//
//  Created by xtayqria on 2016/09/18.
//  Copyright © 2016年 xtayqria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MyView *view = [[MyView alloc] init];
    view.numTF.textBlock = ^(NSString *num) {
        NSLog(@"num=%@",num);
    };
    view.pwdTF.textBlock = ^(NSString *pwd) {
        NSLog(@"pwd=%@",pwd);
    };
    [self.view addSubview:view];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
