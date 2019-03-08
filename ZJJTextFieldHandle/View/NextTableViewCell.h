//
//  NextTableViewCell.h
//  ZJJTextFieldHandle
//
//  Created by YD on 2019/3/8.
//  Copyright © 2019年 YD. All rights reserved.
//

@class NextTableViewCell;

#import <UIKit/UIKit.h>

@protocol PassTextIndexDelegate <NSObject>

- (void)everyTFText:(NSString *)text cell:(NextTableViewCell *)cell;

@end

NS_ASSUME_NONNULL_BEGIN

@interface NextTableViewCell : UITableViewCell

@property (nonatomic, weak) id <PassTextIndexDelegate> cellDelegate;

@property (nonatomic, copy) NSString *textString;

@end

NS_ASSUME_NONNULL_END
