//
//  YFPickerViewVC.m
//  YFTool
//
//  Created by ios_yangfei on 2018/4/23.
//  Copyright © 2018年 jianghu3. All rights reserved.
//

#import "YFPickerViewVC.h"
#import <Masonry.h>
#import "YFPickerView.h"
#import "YFSinglePickerView.h"
#import "YFDoublePickerView.h"
#import "YFThreePickerView.h"

@interface YFPickerViewVC ()<YFPickerViewDelegate>
@property(nonatomic,strong)YFSinglePickerView *singlePickerView;
@property(nonatomic,strong)YFDoublePickerView *doublePickerView;
@property(nonatomic,strong)YFThreePickerView *threePickerView;
@property(nonatomic,strong)YFPickerView *pickerView;
@end

@implementation YFPickerViewVC

-(void)viewDidLoad{
    
    [super viewDidLoad];
    [self setUpView];
    
}

-(void)setUpView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass([self class]);
    NSArray *arr = @[@"YFSinglePickerView",@"YFDoublePickerView",@"YFThreePickerView",@"YFPickerViewDelegate"];
    for (NSInteger i=0; i<arr.count; i++) {
        
        UIButton *btn = [UIButton new];
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset=0;
            make.top.offset= 100 + 40 * i + 40 * i;
            make.height.offset=40;
            make.width.offset=200;
        }];
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(clickShowPickView:) forControlEvents:UIControlEventTouchUpInside];
 
    }
}

-(void)clickShowPickView:(UIButton *)btn{
    switch (btn.tag - 100) {
        case 0:
            [self.singlePickerView show];
            break;
        case 1:
            [self.doublePickerView show];
            break;
        case 2:
            [self.threePickerView show];
            break;
        default:
            [self.pickerView showPickerView];
            break;
    }
}

#pragma mark ====== YFPickerViewDelegate =======
/**
 点击确定按钮的回调
 
 @param pickerView      YFPickerView对象
 @param row_1           第一个UIPickerView选择的row
 @param row_2           第二个UIPickerView选择的row
 @param row_3           第三个UIPickerView选择的row
 */
-(void)pickerView:(YFPickerView *)pickerView clickSureActionRow1:(NSInteger)row_1 row2:(NSInteger)row_2 row3:(NSInteger)row_3{
    NSLog(@"row_1: %ld row_2: %ld row_3: %ld",row_1,row_2,row_3);
}

/**
 选择某一个UIPickerView的回调
 
 @param pickerView      YFPickerView对象
 @param indexPath       UIPickerView选择的row
 */
-(void)pickerView:(YFPickerView *)pickerView didSelectIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section ) {
        case 0:
            pickerView.secondArr = @[@"11月",@"22月",@"33月",@"44月",@"55月"];
            break;
        case 1:
            pickerView.thirdArr = @[@"1日",@"2日",@"3日",@"4日",@"5日"];
            break;
        case 2:
            pickerView.secondArr =  @[@"1月",@"2月",@"3月",@"4月",@"5月"];
            break;
        default:
            break;
    }
    
    [pickerView reloadData];
}

/**
 UIPickerView的文字显示处理
 
 @param pickerView       YFPickerView对象
 @param indexPath        UIPickerView当前的row
 @param textLab          UIPickerView当前的row对应显示的view
 */
-(void)pickerView:(YFPickerView *)pickerView viewForIndexPath:(NSIndexPath *)indexPath view:(UILabel *)textLab{
    switch (indexPath.section ) {
        case 0:
            textLab.text = pickerView.firstArr[indexPath.row];
            break;
        case 1:
            textLab.text = pickerView.secondArr[indexPath.row];
            break;
        case 2:
            textLab.text = pickerView.thirdArr[indexPath.row];
            break;
        default:
            break;
    }
}

-(YFPickerView *)pickerView{
    if (_pickerView==nil) {
        _pickerView=[[YFPickerView alloc] initWithType:YFPickerViewTypeThreeRow];
        _pickerView.titleStr = @"YFPickerViewDelegate";
        _pickerView.firstArr = @[@"2018年",@"2019年",@"2020年",@"2021年"];
        _pickerView.secondArr = @[@"1月",@"2月",@"3月",@"4月",@"5月"];
        _pickerView.thirdArr = @[@"1日",@"2日",@"3日",@"4日",@"5日",@"12日",@"13日",@"14日",@"15日",@"22日",@"23日",@"24日",@"25日"];
        _pickerView.delegate = self;
    }
    return _pickerView;
}

-(YFSinglePickerView *)singlePickerView{
    if (_singlePickerView==nil) {
        _singlePickerView=[[YFSinglePickerView alloc] initWithType:YFPickerViewTypeOneRow];
        _singlePickerView.titleStr = @"YFSinglePickerView";
        _singlePickerView.dataSource = @[@"11111",@"2222",@"3333",@"4444"];
        _singlePickerView.chooseBlock = ^(NSString *str1, NSString *str2, NSString *str3) {
            NSLog(@"%@-%@-%@",str1,str2,str3);
        };
    }
    return _singlePickerView;
}

-(YFDoublePickerView *)doublePickerView{
    if (_doublePickerView==nil) {
        _doublePickerView=[[YFDoublePickerView alloc] initWithType:YFPickerViewTypeTwoRow];
        _doublePickerView.titleStr = @"YFDoublePickerView";
        _doublePickerView.dataSource = @[];
        _doublePickerView.chooseBlock = ^(NSString *str1, NSString *str2, NSString *str3) {
            NSLog(@"%@-%@-%@",str1,str2,str3);
        };
    }
    return _doublePickerView;
}

-(YFThreePickerView *)threePickerView{
    if (_threePickerView==nil) {
        _threePickerView=[[YFThreePickerView alloc] initWithType:YFPickerViewTypeThreeRow];
        _threePickerView.titleStr = @"YFThreePickerView";
        _threePickerView.dataSource = @[];
        _threePickerView.chooseBlock = ^(NSString *str1, NSString *str2, NSString *str3) {
            NSLog(@"%@-%@-%@",str1,str2,str3);
        };
    }
    return _threePickerView;
}


@end
