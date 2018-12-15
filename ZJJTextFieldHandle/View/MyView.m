//
//  MyView.m
//  ZJJTextFieldHandle
//
//  Created by xtayqria on 2016/09/18.
//  Copyright © 2016年 xtayqria. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(50, 600, 270, 130);
        self.backgroundColor = [UIColor cyanColor];
        [self customView];
    }
    return self;
}

- (void)customView {
    self.numTF = [[XtayTextField alloc] initWithFrame:CGRectMake(10, 10, 250, 50)];
    _numTF.borderStyle = UITextBorderStyleRoundedRect;
    _numTF.placeholder = @"请输入账号";
    [self addSubview:_numTF];
    
    self.pwdTF = [[XtayTextField alloc] initWithFrame:CGRectMake(10, 70, 250, 50)];
    _pwdTF.borderStyle = UITextBorderStyleRoundedRect;
    _pwdTF.placeholder = @"请输入密码";
    [self addSubview:_pwdTF];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
