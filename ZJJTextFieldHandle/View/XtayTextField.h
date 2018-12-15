//
//  XtayTextField.h
//  ZJJTextFieldHandle
//
//  Created by xtayqria on 2016/09/18.
//  Copyright © 2016年 xtayqria. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^endEditingText)(NSString *);

@interface XtayTextField : UITextField

@property (nonatomic, copy) endEditingText textBlock;

/**
 如果输入框没有左视图,则不用管 image 属性
 */
@property (nonatomic, strong) UIImage *image;

@end
