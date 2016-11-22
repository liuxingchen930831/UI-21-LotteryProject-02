//
//  XMGActiveMenu.m
//  小码哥彩票
//
//  Created by xiaomage on 15/6/28.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "XMGActiveMenu.h"

#import "XMGCover.h"



@implementation XMGActiveMenu

// 点击关闭按钮的时候，通知控制器隐藏活动菜单
- (IBAction)close:(id)sender {
    if ([_delegate respondsToSelector:@selector(activeMenuDidClickCloseBtn:)]) {
        [_delegate activeMenuDidClickCloseBtn:self];
    }
   
}

#pragma mark - 显示菜单
+ (instancetype)showInPoint:(CGPoint)point
{
    // 创建活动菜单
    XMGActiveMenu  *menu = [XMGActiveMenu activeMenu];
    
    menu.center = point;
    
    [XCKeyWindow addSubview:menu];
    
    return menu;
}
#pragma mark - 隐藏菜单
+ (void)hideInPoint:(CGPoint)point completion:(void (^)())completion
{
    void(^completion1)() = ^{
        // 动画执行完成的时候调用
        if (completion) {
            completion();
        }
    };
    
    for (XMGActiveMenu *childView in XCKeyWindow.subviews) {
        if ([childView isKindOfClass:self]) {
            [childView setUpHideAnim:point completion:completion1];
        }
    }
}

#pragma mark - 隐藏动画
- (void)setUpHideAnim:(CGPoint)point completion:(void (^)())completion
{
    // 当前控件慢慢移动到某个位置，慢慢缩放，最后消失，蒙版也要消失
    [UIView animateWithDuration:1 animations:^{
        
        //        self.center = CGPointMake(44, 44);
        // 修改父类的frame，并不会影响里面子控件
        //        self.frame = CGRectMake(44, 44, 0, 0);
        
        // 利用自动布局解决了子控件随着父控件的尺寸改变而改变
        
        // 修改形变。如果直接缩放为0，父控件马上消失。
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        
        transform = CGAffineTransformTranslate(transform, -self.center.x + point.x, -self.center.y + point.y);
        
        transform = CGAffineTransformScale(transform, 0.01, 0.01);
        
        
        self.transform = transform;
        
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
        // 动画完成的时候，也需要告诉外界，
        
        if (completion) {
            completion();
        }
        
    }];
    

}

+ (instancetype)activeMenu
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}
@end
