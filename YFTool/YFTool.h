//
//  YFTool.h
//  YFPageViewControllerVC
//
//  Created by ios_yangfei on 2018/4/20.
//  Copyright © 2018年 jianghu3. All rights reserved.
//

#ifndef YFTool_h
#define YFTool_h

#import "UIView+Extension.h"
#import "YFIndexIndicatorView.h"
#import "YFCollectionViewAutoFlowLayout.h"
#import "YFProgressHUD.h"
#import "YLImageView.h"


#define RandomColor [UIColor colorWithRed:(arc4random()%256 /255.0) green:(arc4random()%256 /255.0) blue:(arc4random()%256/255.0) alpha:1.0]

#define getSize(str,h,font)  [str boundingRectWithSize:CGSizeMake(10000, h) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size

#endif /* YFTool_h */
