//
//  XCItems.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/9.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XCItems : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) UIImage *image;

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;


@end
