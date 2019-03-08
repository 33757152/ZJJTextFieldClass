//
//  XtayTextFieldView.h
//  Test
//
//  Created by YD on 2019/3/7.
//  Copyright © 2019年 YD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TextEndDelegate <NSObject>

/**
 获取结果的代理

 @param text 结果
 */
- (void)obtainResultText:(NSString *)text;

@end

@interface XtayTextFieldView : UIView

@property (nonatomic, weak) id <TextEndDelegate> textDelegate;

/**
 如果不是加到tableViewCell上面,则不用管这个属性
 */
@property (nonatomic, copy) NSString *freshText;

/**
 如果输入框没有左视图,则不用管 image 属性
 */
@property (nonatomic, strong) UIImage *image;

@end

NS_ASSUME_NONNULL_END
