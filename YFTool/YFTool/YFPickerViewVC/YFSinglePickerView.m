//
//  YFSinglePickerView.m
//  YFTool
//
//  Created by ios_yangfei on 2018/4/23.
//  Copyright © 2018年 YF_Coder. All rights reserved.
//

#import "YFSinglePickerView.h"

@implementation YFSinglePickerView

-(void)setDataSource:(NSArray *)dataSource{
    [super setDataSource:dataSource];
    self.firstRow = 0;
    [self.firstPicker selectRow:0 inComponent:0 animated:NO];
    self.firstArr = dataSource;
    [self.firstPicker reloadAllComponents];
    
}

-(void)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row view:(UILabel *)textLab{
    textLab.text = self.firstArr[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row{
    self.firstRow=row;
}

-(void)clickSureAction{
    if (self.chooseBlock) self.chooseBlock(self.firstArr[self.firstRow], @"", @"");
}

@end
