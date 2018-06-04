//
//  UITableView+Extension.m
//  YFTool
//
//  Created by ios_yangfei on 2018/6/4.
//  Copyright © 2018年 YF_Coder. All rights reserved.
//

#import "UITableView+Extension.h"
#import <objc/runtime.h>

@implementation UITableView (Extension)

+(void)load{
    Method systemMethod = class_getInstanceMethod(self, @selector(initWithFrame:style:));
    Method customMethod = class_getInstanceMethod(self, @selector(xh_initWithFrame:style:));
    method_exchangeImplementations(systemMethod, customMethod);
}

- (instancetype)xh_initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    UITableView *table = [self xh_initWithFrame:frame style:style];
    if (@available(iOS 11.0, *)) {
        table.estimatedRowHeight = 0;
        table.estimatedSectionHeaderHeight = 0;
        table.estimatedSectionFooterHeight = 0;
        
    }else{
        
        
    }
    return table;
}

@end
