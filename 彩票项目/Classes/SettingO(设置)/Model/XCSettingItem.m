//
//  XCSettingItem.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/22.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCSettingItem.h"

@implementation XCSettingItem
+(instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title subtitle:(NSString *)detail
{
    XCSettingItem *item = [[self alloc]init];
    item.image = image;
    item.titile = title;
    item.detail = detail;
    return item;
}
@end
