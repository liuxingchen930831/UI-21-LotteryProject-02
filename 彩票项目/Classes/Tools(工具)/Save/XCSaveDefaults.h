//
//  XCSaveDefaults.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/21.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCSaveDefaults : NSObject
+ (nullable id)objectForKey:(NSString *)defaultName;
+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;

@end
