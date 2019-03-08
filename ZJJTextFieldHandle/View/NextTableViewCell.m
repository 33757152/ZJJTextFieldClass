//
//  NextTableViewCell.m
//  ZJJTextFieldHandle
//
//  Created by YD on 2019/3/8.
//  Copyright © 2019年 YD. All rights reserved.
//

#import "NextTableViewCell.h"
#import "XtayTextFieldView.h"

@interface NextTableViewCell () <TextEndDelegate>

@property (nonatomic, strong) XtayTextFieldView *tfView;

@end

@implementation NextTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI {
    self.tfView = [[XtayTextFieldView alloc] initWithFrame:CGRectMake(10, 2, 300, 40)];
    self.tfView.backgroundColor = [UIColor cyanColor];
//    self.tfView.image = [UIImage imageNamed:@"down"];
    self.tfView.textDelegate = self;
    [self addSubview:self.tfView];
}

- (void)obtainResultText:(NSString *)text {
    if ([self.cellDelegate respondsToSelector:@selector(everyTFText:cell:)]) {
        [self.cellDelegate everyTFText:text cell:self];
    }
}

- (void)setTextString:(NSString *)textString {
    self.tfView.freshText = textString;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
