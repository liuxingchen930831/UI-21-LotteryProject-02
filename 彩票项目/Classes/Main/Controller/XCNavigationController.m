//
//  XCNavigationController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/1.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCNavigationController.h"

@interface XCNavigationController ()<UINavigationControllerDelegate>
/** 解决nav侧滑手势到跟控制器崩溃bug */
@property(nonatomic,strong)id popDelegate;
@end

@implementation XCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
}
//当程序一启动就会调用该方法
+(void)load
{
    
}
//当前类或者他的子类第一次使用的时候才会调用
+(void)initialize
{
    // 获取哪个类下面的导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
#pragma mark 设置导航条左侧的返回按钮的第二种方法
    //设置导航条左侧的返回按钮的第二种方法
    [bar setTintColor:[UIColor whiteColor]];
    // 可以跳转返回按钮文字的偏移量
//        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
    //设置导航条的富文本
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleAttr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setTitleTextAttributes:titleAttr];
}
#pragma mark - 导航控制器即将显示的时候调用
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 如果展示的控制器是根控制器，就还原pop手势代理
    if (viewController == [self.viewControllers firstObject]) {
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  #pragma mark 设置导航条左侧的返回按钮的第一种方法  
    //设置导航条左侧的返回按钮的第一种方法
    
    //不是跟控制器
    if (self.viewControllers.count != 0) {
        self.hidesBottomBarWhenPushed =YES;
        //如果设置导航条左边按钮的内容，把系统的返回按钮覆盖，导航控制权的滑动返回功能就没有了
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:animated];
    //开启滑动返回功能
    self.interactivePopGestureRecognizer.delegate = nil;
}


-(void)back
{
    [self popViewControllerAnimated:YES];
}
@end
