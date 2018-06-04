//
//  KindCollectionViewCell.m
//  YFCollectionViewFlowLayout
//
//  Created by ios_yangfei on 2018/4/16.
//  Copyright © 2018年 YF_Coder. All rights reserved.
//


#import "KindCollectionViewCell.h"
#import <Masonry.h>

@interface KindCollectionViewCell()
@property(nonatomic,weak)UILabel *titleLab;
@end

@implementation KindCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    
    UILabel *titleLab = [UILabel new];
    [self addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset = 0;
    }];
    titleLab.textColor = [UIColor blackColor];
    titleLab.font = [UIFont systemFontOfSize:12];
    titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab = titleLab;
    
}

-(void)realoadCellWith:(NSString *)title selected:(BOOL)selected{
    self.titleLab.text = title;
    self.backgroundColor = selected ? [UIColor redColor] : [UIColor clearColor];
}

@end

