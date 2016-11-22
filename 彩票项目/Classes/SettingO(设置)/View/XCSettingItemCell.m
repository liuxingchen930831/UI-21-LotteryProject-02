//
//  XCSettingItemCell.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/22.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCSettingItemCell.h"
#import "XCSettingItem.h"
#import "XCSettingItemSwitch.h"
#import "XCSettingItemArrow.h"

@interface XCSettingItemCell ()
/** 箭头 */
@property(nonatomic,strong)UIImageView * arrowView ;
/** 开关 */
@property(nonatomic,strong)UISwitch * switchView ;
@end

@implementation XCSettingItemCell

-(UIImageView *)arrowView
{
    if (_arrowView==nil) {
        _arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _arrowView;
}
-(UISwitch *)switchView
{
    if (_switchView ==nil) {
        _switchView =[[UISwitch alloc]init];
    }
    return _switchView;
}
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"cell";
    XCSettingItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell ==nil) {
        cell = [[XCSettingItemCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    return cell;
}
-(void)setItem:(XCSettingItem *)item
{
    _item = item;
    //设置控件上的内容
    [self setUpData];
    //设置辅助视图
    [self setUpAccessoryView];
}
-(void)setUpData
{
    self.imageView.image = _item.image;
    self.textLabel.text = _item.titile;
    self.detailTextLabel.text = _item.detail;
}
-(void)setUpAccessoryView
{
    if ([_item isKindOfClass:[XCSettingItemArrow class]]) {
        //箭头
        self.accessoryView = self.arrowView;
    }else if ([_item isKindOfClass:[XCSettingItemSwitch class]]){
        //开关
        self.accessoryView = self.switchView;
    }else{
        //还原
        self.accessoryView = nil;
    }
}
@end
