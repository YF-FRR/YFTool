//
//  UIScrollView+Extension.m
//  YFTool
//
//  Created by ios_yangfei on 2018/6/4.
//  Copyright © 2018年 YF_Coder. All rights reserved.
//

#import "UIScrollView+Extension.h"
#import <objc/runtime.h>

@implementation UIScrollView (Extension)

+ (void)load{
    Method systemMethod = class_getInstanceMethod(self, @selector(initWithFrame:));
    Method customMethod = class_getInstanceMethod(self, @selector(xh_initWithFrame:));
    method_exchangeImplementations(systemMethod, customMethod);
}

- (instancetype)xh_initWithFrame:(CGRect)frame{
    UIScrollView *scrollV = [self xh_initWithFrame:frame];
    if (@available(iOS 11.0, *)) {
        scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return scrollV;
}

@end
