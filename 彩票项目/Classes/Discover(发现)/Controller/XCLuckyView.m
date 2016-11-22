//
//  XCLuckyView.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/17.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCLuckyView.h"

@implementation XCLuckyView


- (void)drawRect:(CGRect)rect {
    //自动布局有时候会不好使，就需要别的方案做屏幕适配，可以用绘制的方法绘制到图层上
    UIImage *image = [UIImage imageNamed:@"luck_entry_background"];
    [image drawInRect:rect];
}
@end
