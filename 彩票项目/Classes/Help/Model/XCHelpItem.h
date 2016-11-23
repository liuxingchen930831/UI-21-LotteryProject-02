//
//  XCHelpItem.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/23.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCHelpItem : NSObject

@property(nonatomic,copy)NSString * title ;
@property(nonatomic,copy)NSString * html ;
@property(nonatomic,copy)NSString * ID ;
+(instancetype)itemWithDict:(NSDictionary *)dict;
@end
