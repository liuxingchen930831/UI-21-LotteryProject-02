//
//  XCBasicViewController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/23.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCBasicViewController.h"
#import "XCSettingItemCell.h"
#import "XCSettingGroup.h"
#import "XCSettingItemArrow.h"
#import "XCSettingItemSwitch.h"
@interface XCBasicViewController ()

@end

@implementation XCBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(NSMutableArray *)groups
{
    if (_groups ==nil) {
        _groups =[NSMutableArray array];
    }
    return _groups;
}
#pragma mark - tableView
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
    
    XCSettingItemCell *cell = [XCSettingItemCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
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
        item.itemOpertion(indexPath);
    }
    if ([item isKindOfClass:[XCSettingItemArrow class]]) {
        XCSettingItemArrow *arrowItem = (XCSettingItemArrow *)item;
        if (arrowItem.destVc) {
            UIViewController *vc = [[arrowItem.destVc alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
@end
