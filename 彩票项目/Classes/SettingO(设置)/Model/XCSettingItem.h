//
//  XCSettingItem.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/22.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XCSettingItem : NSObject
/** 子标题 */
@property(nonatomic,strong)NSString * detail ;
/** 图片 */
@property(nonatomic,strong)UIImage * image ;
/** 标题 */
@property(nonatomic,strong)NSString * titile ;


@property(nonatomic,copy)void(^itemOpertion)(NSIndexPath *indexPath) ;


+(instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title subtitle:(NSString *)detail;
@end
