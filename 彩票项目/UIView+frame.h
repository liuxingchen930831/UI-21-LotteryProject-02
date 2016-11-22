//
//  UIView+frame.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/1.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (frame)
// @property如果在分类里面只会生成get,set方法的声明，并不会生成成员属性。
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@end
