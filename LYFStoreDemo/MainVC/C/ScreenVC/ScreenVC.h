//
//  ScreenVC.h
//  LYFStoreDemo
//
//  Created by Lyf on 17/4/19.
//  Copyright © 2017年 com.FLY.lyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenVC : UIViewController

//属性视图
/* 品牌字段 */
@property (assign ,nonatomic) NSString *attributeViewBrandString;

/* 排序字段 */
@property (assign ,nonatomic) NSString *attributeViewSortString;

/** 点击回调 */
@property (nonatomic, copy) void(^sureButtonClickBlock)(NSString *attributeViewBrandString,NSString *attributeViewSortString);

@end
