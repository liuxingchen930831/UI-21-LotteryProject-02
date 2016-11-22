//
//  XCItems.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/9.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCItems.h"

@implementation XCItems
+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title
{
    XCItems *item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    
    return item;
}
@end
