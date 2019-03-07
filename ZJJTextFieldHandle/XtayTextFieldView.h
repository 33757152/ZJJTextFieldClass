//
//  XtayTextFieldView.h
//  Test
//
//  Created by YD on 2019/3/7.
//  Copyright © 2019年 YD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^endEditingText)(NSString *);

@interface XtayTextFieldView : UIView

@property (nonatomic, copy) endEditingText textBlock;
@property (nonatomic, strong) UITextField *myTextField;

/**
 如果输入框没有左视图,则不用管 image 属性
 */
@property (nonatomic, strong) UIImage *image;

@end

NS_ASSUME_NONNULL_END
