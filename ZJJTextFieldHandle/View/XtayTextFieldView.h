//
//  XtayTextFieldView.h
//  Test
//
//  Created by YD on 2019/3/7.
//  Copyright © 2019年 YD. All rights reserved.
//

@class XtayTextFieldView;

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TextEndDelegate <NSObject>

/**
 获取结果的代理
 
 @param text 结果
 */
- (void)obtainResultText:(NSString *)text cellView:(XtayTextFieldView *)cellView;

@end

@interface XtayTextFieldView : UIView

@property (nonatomic, weak) id <TextEndDelegate> textDelegate;

/**
 重新给textField赋值
 */
@property (nonatomic, copy) NSString *freshText;

/**
 字体居中方式
 */
@property (nonatomic, assign) NSTextAlignment textAlignment;

/**
 水印提示
 */
@property (nonatomic, copy) NSString *placeholder;

/**
 textField 的左视图
 */
@property (nonatomic, strong) UIImage *image;

@end

NS_ASSUME_NONNULL_END
