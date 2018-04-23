//
//  YFPickerViewVC.m
//  YFTool
//
//  Created by ios_yangfei on 2018/4/23.
//  Copyright © 2018年 jianghu3. All rights reserved.
//

#import "YFPickerViewVC.h"
#import <Masonry.h>
#import "YFSinglePickerView.h"
#import "YFDoublePickerView.h"
#import "YFThreePickerView.h"

@interface YFPickerViewVC ()
@property(nonatomic,strong)YFSinglePickerView *singlePickerView;
@property(nonatomic,strong)YFDoublePickerView *doublePickerView;
@property(nonatomic,strong)YFThreePickerView *threePickerView;
@end

@implementation YFPickerViewVC

-(void)viewDidLoad{
    
    [super viewDidLoad];
    [self setUpView];
    
}

-(void)setUpView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass([self class]);
    NSArray *arr = @[@"YFSinglePickerView",@"YFDoublePickerView",@"YFThreePickerView"];
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
            break;
    }
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
