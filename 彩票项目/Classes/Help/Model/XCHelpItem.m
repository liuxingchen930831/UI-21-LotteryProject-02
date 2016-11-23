//
//  XCHelpItem.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/23.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCHelpItem.h"

@implementation XCHelpItem
+(instancetype)itemWithDict:(NSDictionary *)dict
{
#pragma mark - 第二种方法重写kvc(解析json中包含id int 等特殊字符串)
    XCHelpItem *item = [XCHelpItem objcWithDict:dict mapDict:@{@"ID":@"id"}];
//    [item setValuesForKeysWithDictionary:dict];
    return item;
}
#pragma mark - 第一种方法重写kvc(解析json中包含id int 等特殊字符串)
//重写kvc,help中有个id,不可以直接用,需要重写kvc判断一下是否包含"id"
- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"ID"];
    }else{
        [super setValue:value forKey:key];
    }
}
@end
