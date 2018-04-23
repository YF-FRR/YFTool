//
//  YFProgressHUDVC.m
//  YFTool
//
//  Created by ios_yangfei on 2018/4/21.
//  Copyright © 2018年 jianghu3. All rights reserved.
//

#import "YFProgressHUDVC.h"
#import "YFTool.h"

@interface YFProgressHUDVC ()

@end

@implementation YFProgressHUDVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass([self class]);
    
    
    UIButton *startBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    startBtn.frame=CGRectMake(100,200, 60, 30);
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [self.view addSubview:startBtn];
    [startBtn addTarget:self action:@selector(startPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *stopBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    stopBtn.frame=CGRectMake(100,300, 60, 30);
    [stopBtn setTitle:@"结束" forState:UIControlStateNormal];
    [self.view addSubview:stopBtn];
    [stopBtn addTarget:self action:@selector(stopPressed:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void) startPressed:(UIButton *)button
{
    
    //    [YFProgressHUD showProgressHUDinView:self.view title:@"lajflasjsdlf" imagesArr:@[@"loading_circle@2x",@"loading_square@2x",@"loading_triangle@2x"]];
    
//    [YFProgressHUD showProgressHUDWithTitle:@"大酒店vla" imagesArr:@[@"loading_circle@2x",@"loading_square@2x",@"loading_triangle@2x"]];
//        [YFProgressHUD showProgressHUDWithTitle:@"adsfads" gifImg:@"2.gif"];
        [YFProgressHUD showProgressHUDinView:self.view title:@"adfasdf"];
    //    [YFProgressHUD showProgressHUDWithTitle:@"adfasdf"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [YFProgressHUD hiddenProgressHUD];
        [YFProgressHUD hiddenProgressHUDforView:self.view];
    });
    
}


-(void) stopPressed:(UIButton *)button
{
    
    
}

@end

