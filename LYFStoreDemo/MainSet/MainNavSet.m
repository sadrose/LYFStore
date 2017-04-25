//
//  MainNavSet.m
//  LYFStoreDemo
//
//  Created by Lyf on 17/4/19.
//  Copyright © 2017年 com.FLY.lyf. All rights reserved.
//

#import "MainNavSet.h"
#import "UIBarButtonItem+DCBarButtonItem.h"

@interface MainNavSet ()<UIGestureRecognizerDelegate>

@end

@implementation MainNavSet

#pragma mark - 初始化
/**
 只加载一次
 */
+(void)load
{
    //设置bar字体
    UINavigationBar *bar = [UINavigationBar appearance];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setTitleTextAttributes:dict];
    
    //设置bar背景图片
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    //设置item的字体和颜色
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *itemDict = [NSMutableDictionary dictionary];
    itemDict[NSForegroundColorAttributeName] = [UIColor blackColor];
    itemDict[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    [item setTitleTextAttributes:itemDict forState:UIControlStateNormal];
    
    NSMutableDictionary *itemDisableDict = [NSMutableDictionary dictionary];
    itemDisableDict[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:itemDisableDict  forState:UIControlStateDisabled];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //全屏滑动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    pan.delegate = self;
    //禁止之前的手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
    [self.view addGestureRecognizer:pan];
}

//消除方法警告
-(void)handleNavigationTransition:(UIPanGestureRecognizer *)pan
{
    
}

#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //是否出发手势
    return self.childViewControllers.count > 1;
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {//非根控制器
        //影藏BottomBar
        viewController.hidesBottomBarWhenPushed = YES;
        
        //返回按钮自定义
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] WithHighlightedImage:[UIImage imageNamed:@"navigationButtonReturnClick"] Target:self action:@selector(backViewController) title:@"返回"];
        
    }
    //跳转(自定义以后在这里真正跳转)
    [super pushViewController:viewController animated:animated];
}


/**
 返回
 */
-(void)backViewController
{
    [self popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
