//
//  ChooseTimeView.m
//  JHWaiMaiUpdate
//
//  Created by jianghu3 on 16/6/30.
//  Copyright © 2016年 jianghu2. All rights reserved.
//

#import "YFPickerView.h"
#import "AppDelegate.h"
#import "YFTool.h"

#define PickerThemeColor [UIColor greenColor]
#define PickerViewH 120
#define PickerViewW 120
#define PickerViewRowH 40
#define Margin  15

@interface YFPickerView ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,weak)UIControl *control;
@property(nonatomic,assign)YFPickerViewType type;
@property(nonatomic,weak)UIView *backView;
@property(nonatomic,weak)UIButton *sureBtn;
@property(nonatomic,weak)UILabel *titleLab;
@property(nonatomic,weak)UIView *topLine;
@property(nonatomic,weak)UIView *BotLine;

@end

@implementation YFPickerView

-(instancetype)initWithType:(YFPickerViewType)type{
    if (self = [super initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)]) {
        self.type=type;
        [self configUI];
    }
    return  self;
}

-(void)configUI{
 
    self.titleLabType = YFPickerViewSubViewLocationTopCenter;
    self.sureBtnType = YFPickerViewSubViewLocationTopRight;
    
    UIControl *control = [[UIControl alloc]init];
    control.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    control.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.4];
    [control addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:control];
    self.control=control;
    control.alpha=0.0;
  
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT,WIDTH, 208)];
    [control addSubview:backView];
    backView.layer.cornerRadius=4;
    backView.clipsToBounds=YES;
    backView.backgroundColor=[UIColor whiteColor];
    self.backView = backView;
    
    UILabel *titleLab = [UILabel new];
    [backView addSubview:titleLab];
    [titleLab mas_constraint:^(UIView *make) {
        make.mas_left = 0;
        make.mas_right = 0;
        make.mas_top = 10;
        make.mas_height = 20;
    }];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:16];
    titleLab.textColor = [UIColor blackColor];
    self.titleLab = titleLab;
    
    int count = 1;
    if (self.type==YFPickerViewTypeTwoRow)   count=2;
    if (self.type==YFPickerViewTypeThreeRow) count=3;

    CGFloat marginW = Margin;
    CGFloat pickerW = (WIDTH - marginW * (count + 1))/count;

    if (count == 1) {
        pickerW = PickerViewW;
        marginW = (WIDTH - pickerW)/2.0;
    }
    
    for (NSInteger i=0; i<count; i++) {
        
        UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
        pickerView.dataSource = self;
        pickerView.delegate = self;
        pickerView.backgroundColor=[UIColor whiteColor];
        pickerView.showsSelectionIndicator = YES;

        pickerView.backgroundColor = RandomColor;
        [backView addSubview:pickerView];
        [pickerView mas_constraint:^(UIView *make) {
            make.mas_left = (marginW + pickerW) * i + marginW;
            make.mas_centerY = 10;
            make.mas_width = pickerW;
            make.mas_height = PickerViewH;
        }];

        if (i==0) self.firstPicker=pickerView;
        if (i==1) self.secondPicker=pickerView;
        if (i==2) self.thirdPicker=pickerView;
        
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, PickerViewRowH, pickerW, 1.01)];
        [pickerView addSubview:topLine];
        topLine.backgroundColor = PickerThemeColor;

        UIView *botLine = [[UIView alloc] initWithFrame:CGRectMake(0, PickerViewRowH * 2, pickerW, 1.01)];
        botLine.backgroundColor = PickerThemeColor;
        [pickerView addSubview:botLine];

    }
    
    UIButton *sureBtn=[UIButton new];
    [backView addSubview:sureBtn];
    [sureBtn mas_constraint:^(UIView *make) {
        make.mas_right = -10;
        make.mas_height = 40;
        make.mas_width = 80;
        make.mas_top = 10;
    }];

    sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    sureBtn.layer.borderColor = PickerThemeColor.CGColor;
    sureBtn.layer.borderWidth=1.0;
    sureBtn.layer.cornerRadius=4;
    sureBtn.clipsToBounds=YES;
    [sureBtn setTitle: NSLocalizedString(@"确定", NSStringFromClass([self class])) forState:UIControlStateNormal];
    [sureBtn setTitleColor:PickerThemeColor forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(clickSure) forControlEvents:UIControlEventTouchUpInside];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    self.sureBtn = sureBtn;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return   1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (pickerView==self.firstPicker) return self.firstArr.count;
    if (pickerView==self.secondPicker) return self.secondArr.count;
    return self.thirdArr.count;
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    for(UIView *singleLine in pickerView.subviews)
    {
        if (singleLine.frame.size.height <= 1)
        {
           [singleLine removeFromSuperview];
        }
    }
    
    UILabel *lab = nil;
    lab = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)];
    lab.textAlignment =NSTextAlignmentCenter;
    [self pickerView:pickerView viewForRow:row view:lab];
    lab.font = [UIFont systemFontOfSize:14];
    lab.backgroundColor = [UIColor clearColor];
    
    return lab;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self pickerView:pickerView didSelectRow:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return PickerViewRowH;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component

{
    int count = 1;
    if (self.type==YFPickerViewTypeThreeRow) count=3;
    if (self.type==YFPickerViewTypeTwoRow)   count=2;
    CGFloat pickerW = count == 1 ? PickerViewW :  (WIDTH-20-Margin*(count+1))/count-20;
    return  pickerW;
}

#pragma mark ====== Functions =======
-(void)show{
    
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window addSubview:self.control];
    
    if (self.showType == YFPickerViewShowFromCenter) {
        [UIView animateWithDuration:0.25 animations:^{
            self.control.alpha=1;
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            self.control.alpha=1;
        }];
        [UIView animateWithDuration:0.4 animations:^{
            self.backView.y = HEIGHT -200;
        }];
    }
    
}

-(void)hidden{
    
    if (self.showType == YFPickerViewShowFromCenter) {
        [UIView animateWithDuration:0.4 animations:^{
            self.control.alpha=0;
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            self.backView.y = HEIGHT;
        }];
        [UIView animateWithDuration:0.4 animations:^{
            self.control.alpha=0;
        }];
    }
    [self removeFromSuperview];
}

// 点击确定
-(void)clickSure{
    [self hidden];
    [self clickSureAction];
}

-(void)setShowType:(YFPickerViewShowType)showType{
    _showType = showType;
    if (showType == YFPickerViewShowFromCenter) {
        self.backView.centerY = HEIGHT/2.0;
        self.backView.x = 15;
        self.backView.width = WIDTH - 30;
        
        int count = 1;
        if (self.type==YFPickerViewTypeThreeRow) count=3;
        if (self.type==YFPickerViewTypeTwoRow)   count=2;
        
        CGFloat marginW = Margin;
        CGFloat pickerW = (WIDTH - 30 - marginW * (count + 1))/count;
        
        if (count == 1 && self.showType == YFPickerViewShowFromCenter) {
            pickerW = PickerViewW;
            marginW = (WIDTH - 30 - pickerW)/2.0;
        }

        [self.firstPicker mas_constraint:^(UIView *make) {
            make.mas_left = marginW;
            make.mas_width = pickerW;
        }];

        [self.secondPicker mas_constraint:^(UIView *make) {
            make.mas_left = marginW + pickerW + marginW;
            make.mas_width = pickerW;
        }];

        
        [self.thirdPicker mas_constraint:^(UIView *make) {
            make.mas_left = (marginW + pickerW) * 2 + marginW;
            make.mas_width = pickerW;
        }];

    }
}

-(void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.titleLab.text = titleStr;
}

#pragma mark ====== SubView Location =======
-(void)setSureBtnType:(YFPickerViewSubViewLocationType)sureBtnType{
    _sureBtnType = sureBtnType;
    
    switch (sureBtnType) {
        case YFPickerViewSubViewLocationTopCenter:
            [self.sureBtn mas_constraint:^(UIView *make) {
                make.mas_centerX = 0;
                make.mas_top = 10;
                make.mas_width = 80;
                make.mas_height = 40;
            }];
            break;
        case YFPickerViewSubViewLocationTopLeft:
            [self.sureBtn mas_constraint:^(UIView *make) {
                make.mas_left=10;
                make.mas_top=10;
                make.mas_width = 80;
                make.mas_height = 40;
            }];
            break;
        case YFPickerViewSubViewLocationTopRight:
            [self.sureBtn mas_constraint:^(UIView *make) {
                make.mas_right = -10;
                make.mas_top = 10;
                make.mas_width = 80;
                make.mas_height = 40;
            }];
            break;
        case YFPickerViewSubViewLocationBottomCenter:
            [self.sureBtn mas_constraint:^(UIView *make) {
                make.mas_centerX = 0;
                make.mas_bottom = -10;
                make.mas_width = 80;
                make.mas_height = 40;
            }];
            break;
        case YFPickerViewSubViewLocationBottomLeft:
            [self.sureBtn mas_constraint:^(UIView *make) {
                make.mas_left = 10;
                make.mas_bottom = -10;
                make.mas_width = 80;
                make.mas_height = 40;
            }];
            break;
        case YFPickerViewSubViewLocationBottomRight:
            [self.sureBtn mas_constraint:^(UIView *make) {
                make.mas_right = -10;
                make.mas_bottom = -10;
                make.mas_width = 80;
                make.mas_height = 40;
            }];
            break;
            
        default:
            break;
    }
}

-(void)setTitleLabType:(YFPickerViewSubViewLocationType)titleLabType{
    _titleLabType = titleLabType;
    switch (titleLabType) {
        case YFPickerViewSubViewLocationTopCenter:
            [self.titleLab mas_constraint:^(UIView *make) {
                make.mas_centerX = 0;
                make.mas_top = 10;
                make.mas_height = 20;
            }];
            break;
        case YFPickerViewSubViewLocationTopLeft:
            [self.titleLab mas_constraint:^(UIView *make) {
                make.mas_left=10;
                make.mas_top=10;
                make.mas_height = 20;
            }];
            break;
        case YFPickerViewSubViewLocationTopRight:
            [self.titleLab mas_constraint:^(UIView *make) {
                make.mas_right = -10;
                make.mas_top = 10;
                make.mas_height = 20;
            }];
            break;
        case YFPickerViewSubViewLocationBottomCenter:
            [self.titleLab mas_constraint:^(UIView *make) {
                make.mas_centerX = 0;
                make.mas_bottom = -10;
                make.mas_height = 20;
            }];
            break;
        case YFPickerViewSubViewLocationBottomLeft:
            [self.titleLab mas_constraint:^(UIView *make) {
                make.mas_left = 10;
                make.mas_bottom = -10;
                make.mas_height = 20;
            }];
            break;
        case YFPickerViewSubViewLocationBottomRight:
            [self.titleLab mas_constraint:^(UIView *make) {
                make.mas_right = -10;
                make.mas_bottom = -10;
                make.mas_height = 20;
            }];
            break;
            
        default:
            break;
    }
}



#pragma mark ====== subClass Rewrite =======
-(void)clickSureAction{}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row{}

-(void)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row view:(UILabel *)textLab{}
@end
