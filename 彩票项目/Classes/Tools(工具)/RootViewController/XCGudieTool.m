//
//  XCGudieTool.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/21.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCGudieTool.h"
#import "XCSaveDefaults.h"
#import "XCTabBarController.h"
#import "XCNewFeatureViewController.h"
@implementation XCGudieTool
+(UIViewController *)chooseRootView
{
    
    //获取当前的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    //获取上一次版本号
    NSString *oldVersion = [XCSaveDefaults objectForKey:XCversionKey];
    
    //声明一个空的UIViewController
    UIViewController *rootvc = nil;
    
    if ([currentVersion isEqualToString:oldVersion]) {
        //没有最新的版本号，进入主界面
        rootvc = [[XCTabBarController alloc]init];
    }else{
        rootvc = [[XCNewFeatureViewController alloc]init];
        [XCSaveDefaults setObject:currentVersion forKey:XCversionKey];
    }
    return rootvc;
}
@end
