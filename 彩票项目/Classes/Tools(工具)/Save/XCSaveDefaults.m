//
//  XCSaveDefaults.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/21.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCSaveDefaults.h"

@implementation XCSaveDefaults
+(id)objectForKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}
+(void)setObject:(id)value forKey:(NSString *)defaultName
{
    return [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}
@end
