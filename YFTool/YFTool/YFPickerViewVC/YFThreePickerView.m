//
//  YFThreePickerView.m
//  YFTool
//
//  Created by ios_yangfei on 2018/4/23.
//  Copyright © 2018年 YF_Coder. All rights reserved.
//

#import "YFThreePickerView.h"

@implementation YFThreePickerView
-(NSString *)formateDate:(NSString *)formate dateline:(NSInteger)unixTime{
    
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:unixTime];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formate];
    NSString *currentdateStr = [dateFormatter stringFromDate:detailDate];
    return currentdateStr;
}
// 数据处理
-(void)setDataSource:(NSArray *)dataSource{
    
    NSMutableArray *arr = [NSMutableArray array];
    NSDate *date = [NSDate date];
    NSString *year = [self formateDate:@"yyyy" dateline:[date timeIntervalSince1970]];
    NSString *month = [self formateDate:@"MM" dateline:[date timeIntervalSince1970]];
    for (NSInteger i=0; i<20; i++) {
        NSString *str = [NSString stringWithFormat: NSLocalizedString(@"%ld年", NSStringFromClass([self class])), [year integerValue]+ i];
        NSMutableArray *monthArr = [NSMutableArray array];
        int j =  i == 0 ? ([month intValue] - 1) : 0;
        for ( ; j<12; j++) {
            
            NSString *month = [NSString stringWithFormat: NSLocalizedString(@"%d月", NSStringFromClass([self class])),j+1];
            [monthArr addObject:month];
            
            
        }
       NSMutableArray *dayArr = [NSMutableArray array];
        for (int k = 0 ; k<30; k++) {
            NSString *day = [NSString stringWithFormat: NSLocalizedString(@"%d日", NSStringFromClass([self class])),k+1];
            [dayArr addObject:day];
        }
        NSDictionary *dic = @{@"year":str,@"months":monthArr,@"days":dayArr};
        [arr addObject:dic];
    }
    dataSource = arr.copy;
    
    [super setDataSource:dataSource];
    self.firstArr = dataSource;
    self.secondArr = dataSource.firstObject[@"months"];
    self.thirdArr = dataSource.lastObject[@"days"];
    [self.firstPicker reloadAllComponents];
    [self.secondPicker reloadAllComponents];
    [self.thirdPicker reloadAllComponents];
    
}

-(void)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row view:(UILabel *)textLab{
    if (pickerView==self.firstPicker) textLab.text =self.firstArr[row][@"year"];
    else  if (pickerView==self.secondPicker) textLab.text = self.secondArr[row];
    else  textLab.text = self.thirdArr[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row{
    if (pickerView==self.firstPicker)  {
        self.firstRow=row;
        self.secondArr = self.firstArr[row][@"months"];
    }else if (pickerView==self.secondPicker){
        self.secondRow=row;
        self.thirdArr = self.dataSource.lastObject[@"days"];
    } else {
        self.thirdRow=row;
    }
    [self.firstPicker reloadAllComponents];
    [self.secondPicker reloadAllComponents];
    [self.thirdPicker reloadAllComponents];
}

-(void)clickSureAction{
    NSString *year = self.firstArr[self.firstRow][@"year"];
    NSString *month = self.secondArr[self.secondRow];
    NSString *day = self.dataSource.lastObject[@"days"][self.thirdRow];
    if (self.chooseBlock) self.chooseBlock(year, month, day);
    
}

@end
