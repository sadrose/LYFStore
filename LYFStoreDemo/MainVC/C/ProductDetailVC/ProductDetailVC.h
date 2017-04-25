//
//  ProductDetailVC.h
//  LYFStoreDemo
//
//  Created by Lyf on 17/4/24.
//  Copyright © 2017年 com.FLY.lyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailVC : UIPageViewController

/* 商品头像 */
@property (strong , nonatomic)NSString *goodspics;
/* 商品库存*/
@property (weak, nonatomic) NSString *stockStr;
/* 商品价格 */
@property (weak ,nonatomic) NSString *shopPrice;
/* 商品介绍 */
@property (weak ,nonatomic) NSString *introduce;
/* 商品标题 */
@property (weak ,nonatomic) NSString *goods_title;

/* 商品快递费 */
@property (weak, nonatomic) NSString *expressage;
/* 商品已售出量 */
@property (weak, nonatomic) NSString *saleCount;
/* 商品地点 */
@property (weak, nonatomic) NSString *site;


@end
