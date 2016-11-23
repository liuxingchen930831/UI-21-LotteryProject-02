//
//  NSObject+Model.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/23.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/runtime.h>
@implementation NSObject (Model)
+(instancetype)objcWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict
{
    id obj = [[self alloc]init];
    
   unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    for (int i = 0 ; i <count; i++) {
        Ivar ivar = ivars[i];
        
        //获取属性名称
        NSString *ivarName = @(ivar_getName(ivar));
        //取出的属性是全局变量自带_去掉
        ivarName = [ivarName substringFromIndex:1];
        id value = dict[ivarName];
        
        if (value ==nil) {
            if (mapDict) {
                NSArray *keyName = mapDict[ivarName];
                value = dict[keyName];
            }
        }
        [obj setValue:value forKey:ivarName];
    }
    return obj ;
}
@end
