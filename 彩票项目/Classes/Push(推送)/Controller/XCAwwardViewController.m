//
//  XCAwwardViewController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/23.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCAwwardViewController.h"
#import "XCSettingItemSwitch.h"
#import "XCSettingGroup.h"
#import "XCSettingItemCell.h"
@interface XCAwwardViewController ()

@end

@implementation XCAwwardViewController

-(instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGroup0];
}
-(void)setupGroup0
{
    XCSettingItemSwitch *item = [XCSettingItemSwitch settingItemWithImage:[UIImage imageNamed:@"MoreMessage"] title:@"开奖时间" subtitle:@"1:00"];
    XCSettingItemSwitch *item1 = [XCSettingItemSwitch settingItemWithImage:[UIImage imageNamed:@"MoreMessage"] title:@"开奖时间" subtitle:@"2:00"];
    XCSettingItemSwitch *item2 = [XCSettingItemSwitch settingItemWithImage:[UIImage imageNamed:@"MoreMessage"] title:@"开奖时间" subtitle:@"3:00"];
    XCSettingItemSwitch *item3 = [XCSettingItemSwitch settingItemWithImage:[UIImage imageNamed:@"MoreMessage"] title:@"开奖时间" subtitle:@"4:00"];
    XCSettingGroup *group = [XCSettingGroup groupWithItem:@[item,item1,item2,item3]];
    [self.groups addObject:group];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XCSettingItemCell *cell = [XCSettingItemCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    XCSettingGroup *group = self.groups[indexPath.section];
    XCSettingItemSwitch *item = group.item[indexPath.row];
    cell.item = item;
    return cell;
}
@end
