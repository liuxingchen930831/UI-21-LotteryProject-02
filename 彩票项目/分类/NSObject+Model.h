//
//  NSObject+Model.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/23.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

/**
 用runtime解决,解析json中包含id int 等特殊字符串
 */
+(instancetype)objcWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict;
@end
