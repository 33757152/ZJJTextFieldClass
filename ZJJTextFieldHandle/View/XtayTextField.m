//
//  XtayTextField.m
//  ZJJTextFieldHandle
//
//  Created by xtayqria on 2016/09/18.
//  Copyright © 2016年 xtayqria. All rights reserved.
//
#define   SINGLE_NOTICE    [NSNotificationCenter defaultCenter]
#define   SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define   SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height

#import "XtayTextField.h"

@interface XtayTextField () <UITextFieldDelegate> {
    float _keyboardHeight;  // 键盘高度
}

@end

@implementation XtayTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.returnKeyType = UIReturnKeyDone;
        [SINGLE_NOTICE addObserver:self selector:@selector(keyBoardWillShown:) name:UIKeyboardWillShowNotification object:nil];
    }
    return self;
}

- (void)keyBoardWillShown:(NSNotification *)noti {
    NSDictionary *info = [noti userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [value CGRectValue];
    _keyboardHeight = keyboardRect.size.height;
}

- (void)makeTFVisible {
    CGRect absoluteFrame = [self convertRect:self.window.frame toView:self.window];
    float textFieldUpHeight = _keyboardHeight - (SCREEN_HEIGHT - (self.frame.size.height + absoluteFrame.origin.y));
    if (textFieldUpHeight > 0) {
        float offsetValue = 15+self.frame.size.height/2;
        [UIView animateWithDuration:0.25 animations:^{
            self.window.frame = CGRectMake(0, -textFieldUpHeight-offsetValue, SCREEN_WIDTH, SCREEN_HEIGHT);
        }];
    }
}

#pragma mark - 输入框代理方法 -
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (_keyboardHeight == 0) {
        __weak XtayTextField *weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf makeTFVisible];
        });
    } else {
        [self makeTFVisible];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.textBlock) {
        self.textBlock(textField.text);
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.window.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.returnKeyType == UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark - 输入框左视图赋值
- (void)setImage:(UIImage *)image {
    if (image) {
        [self creatLeftViewWithImage:image];
    }
}

- (void)creatLeftViewWithImage:(UIImage *)image {
    float tfH = self.frame.size.height;
    UIView *momView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tfH, tfH)];
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = image;
    imageV.frame = CGRectMake(5, 5, tfH-10, tfH-10);
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    [momView addSubview:imageV];
    self.leftView = momView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)dealloc {
    [SINGLE_NOTICE removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
