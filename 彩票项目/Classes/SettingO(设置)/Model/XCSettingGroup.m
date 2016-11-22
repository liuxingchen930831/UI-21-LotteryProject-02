//
//  XCSettingGroup.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/22.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCSettingGroup.h"

@implementation XCSettingGroup
+(instancetype)groupWithItem:(NSArray *)item
{
    XCSettingGroup *group =[[self alloc]init];
    group.item = item;
    return group;
}
@end
