//
//  XCSettingGroup.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/22.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCSettingGroup : NSObject
/** 组里面存了多少行 */
@property(nonatomic,strong)NSArray * item ;

/** 头部title */
@property(nonatomic,copy)NSString * header ;

/** 尾部title */
@property(nonatomic,copy)NSString * foot ;

+(instancetype)groupWithItem:(NSArray *)item;
@end
