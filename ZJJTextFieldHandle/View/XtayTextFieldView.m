//
//  XtayTextFieldView.m
//  Test
//
//  Created by YD on 2019/3/7.
//  Copyright © 2019年 YD. All rights reserved.
//
#define   SINGLE_NOTICE    [NSNotificationCenter defaultCenter]
#define   SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define   SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height

#import "XtayTextFieldView.h"
#import "GetCurrentVC.h"

@interface XtayTextFieldView () <UITextFieldDelegate>

@property (nonatomic, assign) CGFloat keyBoardHeight; // 键盘高度
@property (nonatomic, strong) UIView *currentVCView;
@property (nonatomic, strong) UITextField *myTextField;

@end

@implementation XtayTextFieldView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.currentVCView = [[GetCurrentVC obtainCurrentViewController] view];
        [self creatTextField];
    }
    return self;
}

- (void)creatTextField {
    self.myTextField = [[UITextField alloc] initWithFrame:self.bounds];
    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.myTextField.delegate = self;
    self.myTextField.returnKeyType = UIReturnKeyDone;
    self.myTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:self.myTextField];
    [SINGLE_NOTICE addObserver:self selector:@selector(keyBoardWillShown:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyBoardWillShown:(NSNotification *)noti {
    NSDictionary *info = [noti userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [value CGRectValue];
    self.keyBoardHeight = keyboardRect.size.height;
}

- (void)makeTFVisible {
    CGRect absoluteFrame = [self convertRect:self.currentVCView.frame toView:self.currentVCView];
    CGFloat textFieldUpHeight = self.keyBoardHeight - (SCREEN_HEIGHT - (self.frame.size.height + absoluteFrame.origin.y));
    CGFloat tfHeight = self.frame.size.height;
    if (textFieldUpHeight > -tfHeight && textFieldUpHeight > 0) {
        [UIView animateWithDuration:0.25 animations:^{
            self.currentVCView.frame = CGRectMake(0, -textFieldUpHeight-tfHeight, self.currentVCView.frame.size.width, self.currentVCView.frame.size.height);
        }];
    }
}

#pragma mark - 输入框代理方法 -
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.keyBoardHeight == 0) {
        __weak XtayTextFieldView *weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf makeTFVisible];
        });
    } else {
        [self makeTFVisible];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self.textDelegate respondsToSelector:@selector(obtainResultText: cellView:)]) {
        [self.textDelegate obtainResultText:textField.text cellView:self];
    }
    [UIView animateWithDuration:0.25 animations:^{
         self.currentVCView.frame = CGRectMake(0, SCREEN_HEIGHT-self.currentVCView.frame.size.height, self.currentVCView.frame.size.width, self.currentVCView.frame.size.height);
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.returnKeyType == UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)setFreshText:(NSString *)freshText {
    self.myTextField.text = freshText;
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
    self.myTextField.leftView = momView;
    self.myTextField.leftViewMode = UITextFieldViewModeAlways;
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
