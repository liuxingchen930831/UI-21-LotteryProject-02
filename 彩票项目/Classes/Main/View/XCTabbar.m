//
//  XCTabbar.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/1.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCTabbar.h"
#import "XCTabbarButton.h"
@interface XCTabbar ()
@property(nonatomic,weak)XCTabbarButton * selectButton ;
@end
@implementation XCTabbar
-(void)setItems:(NSArray *)items
{
    _items = items;
    // UITabBarItem保存按钮上的图片
    for (UITabBarItem *item in items) {
        
        XCTabbarButton *button = [XCTabbarButton buttonWithType:UIButtonTypeCustom];
        
        button.tag = self.subviews.count;
        
        [button setBackgroundImage:item.image forState:UIControlStateNormal];
        
        [button setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview: button];
        //默认选择第一个
        if (self.subviews.count == 1) {
            [self buttonClick:button];
        }
    }
}
//button的点击状态
-(void)buttonClick:(XCTabbarButton *)button
{
    self.selectButton.selected = NO;
    
    button.selected = YES;
    
    self.selectButton = button;
    // 通知tabBarVc切换控制器
    if ([_delegate respondsToSelector:@selector(tabbar:didClickButtonIndex:)]) {
        [_delegate tabbar:self didClickButtonIndex:button.tag];
        NSLog(@"button.tag = %ld",button.tag);
    }
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    int item = (int)_items.count;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width/item;
    CGFloat h = self.bounds.size.height;
    for (int i = 0; i <item; i++) {
        UIButton *button = self.subviews[i];
        button.frame = CGRectMake(i * w, y, w, h);
    }
}
@end
