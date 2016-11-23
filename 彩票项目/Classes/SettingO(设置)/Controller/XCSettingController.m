//
//  XCSettingController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/21.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCSettingController.h"
#import "XCSettingItemCell.h"
#import "XCSettingGroup.h"
#import "XCSettingItemArrow.h"
#import "XCSettingItemSwitch.h"
#import "XCPushViewController.h"
#import "MBProgressHUD+XMG.h"
#import "XCHelpViewController.h"
@interface XCSettingController ()


@end

@implementation XCSettingController

-(instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(help)];
    //设置模型的数据源
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
}
-(void)help
{
    XCHelpViewController *vc = [[XCHelpViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)setupGroup0
{
    XCSettingItemArrow *item = [XCSettingItemArrow settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"红包" subtitle:@"(⊙o⊙)…"];
    XCSettingItemSwitch *item1 = [XCSettingItemSwitch settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"红包" subtitle:nil];
    //告诉每组有多少行
    XCSettingGroup *group = [XCSettingGroup groupWithItem:@[item,item1]];
    group.header = @"红包";
    group.foot = @"~~~~~";
    
    [self.groups addObject:group];
    
}
-(void)setupGroup1
{
    XCSettingItemArrow *item = [XCSettingItemArrow settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"点击跳转" subtitle:nil];
    item.destVc= [XCPushViewController class];
    
    XCSettingItemArrow *item1 = [XCSettingItemArrow settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"红包2" subtitle:nil];
    XCSettingItemArrow *item2 = [XCSettingItemArrow settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"111" subtitle:nil];
    XCSettingItemArrow *item3 = [XCSettingItemArrow settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"红包4" subtitle:nil];
    
    //告诉每组有多少行
    XCSettingGroup *group = [XCSettingGroup groupWithItem:@[item,item1,item2,item3]];
    [self.groups addObject:group];
    
}
-(void)setupGroup2
{
    XCSettingItemSwitch *item = [XCSettingItemSwitch settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"红包5" subtitle:nil];
    XCSettingItemArrow *item1 = [XCSettingItemArrow settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"红包6" subtitle:nil];
    XCSettingItemSwitch *item2 = [XCSettingItemSwitch settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"红包7" subtitle:nil];
    XCSettingItemArrow *item3 = [XCSettingItemArrow settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"检查新版本" subtitle:nil];
    item3.itemOpertion = ^(NSIndexPath * indexPath){
        [MBProgressHUD showMessage:@"最新版本"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUD];
        });
        
    };
    
    //告诉每组有多少行
    XCSettingGroup *group = [XCSettingGroup groupWithItem:@[item,item1,item2,item3]];
    [self.groups addObject:group];
    
}

@end
