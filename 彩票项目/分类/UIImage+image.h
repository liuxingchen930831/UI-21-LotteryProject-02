//
//  UIImage+image.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/1.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)
/**
 返回原始图片样式不会被渲染
 */
+(instancetype)imageWithOriginalRenderingImage:(NSString *)imageName;
@end
