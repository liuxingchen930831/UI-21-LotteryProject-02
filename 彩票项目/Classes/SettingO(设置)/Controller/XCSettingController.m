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

#import "MBProgressHUD+XMG.h"
@interface XCSettingController ()

/** 存放数据模型 */
@property(nonatomic,strong)NSMutableArray * groups ;

@end

@implementation XCSettingController
-(NSMutableArray *)groups
{
    if (_groups ==nil) {
        _groups =[NSMutableArray array];
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置模型的数据源
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
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
    XCSettingItemArrow *item = [XCSettingItemArrow settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"红包1" subtitle:nil];
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
    item3.itemOpertion = ^{
        [MBProgressHUD showMessage:@"最新版本"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUD];
        });
        
    };
    
    //告诉每组有多少行
    XCSettingGroup *group = [XCSettingGroup groupWithItem:@[item,item1,item2,item3]];
    [self.groups addObject:group];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //取出组
    XCSettingGroup *group = self.groups[section];
    return group.item.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    XCSettingItemCell *cell = [XCSettingItemCell cellWithTableView:tableView];
    //取出某一组
    XCSettingGroup *group = self.groups[indexPath.section];
    //取出某一行
    XCSettingItem *item = group.item[indexPath.row];
    cell.item = item;
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    XCSettingGroup *group = self.groups[section];
    return group.header;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    XCSettingGroup *group = self.groups[section];
    return group.foot;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    XCSettingGroup *group = self.groups[indexPath.section];
    //从模型中取出选中的行
    XCSettingItem *item = group.item[indexPath.row];
    
    if (item.itemOpertion) {
        item.itemOpertion();
    }
}
@end
