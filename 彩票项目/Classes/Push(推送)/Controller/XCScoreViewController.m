//
//  XCScoreViewController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/23.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCScoreViewController.h"
#import "XCSettingGroup.h"
#import "XCSettingItemArrow.h"
@interface XCScoreViewController ()

@end

@implementation XCScoreViewController
-(instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGroup0];
    [self setupGroup1];
}
-(void)setupGroup0
{
    XCSettingItemArrow *item = [XCSettingItemArrow settingItemWithImage:nil title:@"起始时间" subtitle:@"00:00"];
    XCSettingGroup *group = [XCSettingGroup groupWithItem:@[item]];
    group.header = @"1111111";
    [self.groups addObject:group];
}
-(void)setupGroup1
{
    XCSettingItemArrow *item = [XCSettingItemArrow settingItemWithImage:nil title:@"起始时间" subtitle:@"24:00"];
    //第一种写的方式
//    __weak XCScoreViewController *weakSelf = self;
    
    //第二种写的方式
    __weak typeof(self) weakSelf = self;
    
    //block会把代码里所有的强指针,全部引用。解决方法：把当前的类声明成弱引用
    item.itemOpertion = ^(NSIndexPath *indePath){
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indePath];
        
        UITextField *fild = [[UITextField alloc]init];
        fild.backgroundColor = [UIColor redColor];
        
        [fild becomeFirstResponder];
        
        [cell addSubview:fild];
    };
    XCSettingGroup *group = [XCSettingGroup groupWithItem:@[item]];
    group.foot = @"只在以下时间段接收比分直播推送";
    [self.groups addObject:group];
}
-(void)dealloc
{
    NSLog(@"%s, line = %d",__FUNCTION__,__LINE__);
}
@end
