//
//  XCTabbar.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/1.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCTabbar;
@protocol XCTabbarDelegate <NSObject>

@optional
-(void)tabbar:(XCTabbar *)tabbar didClickButtonIndex:(NSInteger)index;
@end

@interface XCTabbar : UIView
/** 模型数组UITabbar */
@property(nonatomic,strong)NSArray * items ;
@property(nonatomic,weak)id<XCTabbarDelegate> delegate;

@end
