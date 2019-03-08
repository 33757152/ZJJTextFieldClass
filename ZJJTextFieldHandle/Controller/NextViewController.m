//
//  NextViewController.m
//  ZJJTextFieldHandle
//
//  Created by YD on 2019/3/8.
//  Copyright © 2019年 YD. All rights reserved.
//

#import "NextViewController.h"
#import "NextTableViewCell.h"

@interface NextViewController () <UITableViewDelegate, UITableViewDataSource, PassTextIndexDelegate>

@property (nonatomic, strong) UITableView *myTable;

@property (nonatomic, copy) NSMutableArray *textMArray; // 记录的字体输入的数组

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"next";
    [self addData];
    [self.view addSubview:self.myTable];
}

- (void)addData {
    for (NSInteger i = 0; i<30; i++) {
        [self.textMArray addObject:@""];
    }
}

- (NSMutableArray *)textMArray {
    if (!_textMArray) {
        _textMArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _textMArray;
}

- (UITableView *)myTable {
    if (!_myTable) {
        _myTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _myTable.delegate = self;
        _myTable.dataSource = self;
    }
    return _myTable;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.textMArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textString = self.textMArray[indexPath.row];
    cell.cellDelegate = self;
    return cell;
}

- (void)everyTFText:(NSString *)text cell:(NextTableViewCell *)cell {
    NSIndexPath *indexPath = [_myTable indexPathForCell:cell];
    [self.textMArray replaceObjectAtIndex:indexPath.row withObject:text];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
