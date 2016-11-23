//
//  XCPushViewController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/23.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCPushViewController.h"
#import "XCSettingItemCell.h"
#import "XCSettingGroup.h"
#import "XCSettingItemArrow.h"
#import "XCSettingItemSwitch.h"
#import "XCScoreViewController.h"
#import "XCAwwardViewController.h"
@interface XCPushViewController ()

@end

@implementation XCPushViewController

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
    XCSettingItemArrow *item = [XCSettingItemArrow settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"红包" subtitle:nil];
    XCSettingItemArrow *item1 = [XCSettingItemArrow settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"跳转Arrow" subtitle:nil];
    item1.destVc = [XCScoreViewController class];
    
    XCSettingItemArrow *item2 = [XCSettingItemArrow settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"跳转Switch" subtitle:nil];
    item2.destVc = [XCAwwardViewController class];
    XCSettingGroup *group = [XCSettingGroup groupWithItem:@[item,item1,item2]];
    [self.groups addObject:group];
}
@end
