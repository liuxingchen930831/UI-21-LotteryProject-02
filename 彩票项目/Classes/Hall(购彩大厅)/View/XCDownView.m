//
//  XCDownView.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/9.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCDownView.h"
#import "XCItems.h"
#define XCcols 3
#define XCItemWH [UIScreen mainScreen].bounds.size.width / XCcols
@interface XCDownView ()
@property(nonatomic,strong)NSArray * item ;
@property(nonatomic,strong)NSMutableArray * Mitems ;
@end

@implementation XCDownView
-(NSMutableArray *)Mitems
{
    if (_Mitems ==nil) {
        _Mitems = [NSMutableArray array];
    }
    return _Mitems;
}
+(instancetype)showshowInView:(UIView *)superView items:(NSArray *)itmes oriY:(CGFloat)oriY
{
    NSUInteger count = itmes.count;
    NSInteger row = (count - 1) / XCcols +1;
    CGFloat menH = row * XCItemWH;
    
    XCDownView *view = [[XCDownView alloc]initWithFrame:CGRectMake(0, oriY, [UIScreen mainScreen].bounds.size.width,menH)];
    view.item = itmes;
    [view setUpAllButtons];
    [view setUpDivider];
    //添加黑色的遮挡
    UIView *blackView =[[UIView alloc]initWithFrame:view.frame];
    blackView.backgroundColor = [UIColor blackColor];
    [superView addSubview:blackView];
    view.transform = CGAffineTransformMakeTranslation(0, view.frame.size.height);
    //弹簧效果
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        [blackView removeFromSuperview];
    }];
    view.backgroundColor = [UIColor blackColor];
    [superView addSubview:view];
    
    return view;
}
/**
 *  移除所有子控件
 */
-(void)hide
{
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -self.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
-(void)setUpDivider
{
    // x = (i + 1) * itemWH
    // Y = 0
    // w = 1
    // h = menu.h
    // 竖:总列数 - 1
    for (int i = 0; i < XCcols-1; i++) {
        UIView *divide = [[UIView alloc]init];
        divide.backgroundColor = [UIColor whiteColor];
        divide.frame = CGRectMake((i + 1) * XCItemWH, 0, 1, self.frame.size.height);
        [self addSubview:divide];
    }
    
    // 横:总行数-1
    // x = 0 y = （i + 1） * itemWh w:menu.w h 1
    NSUInteger rows = (self.Mitems.count -1) / XCcols + 1;
    for (int i = 0 ; i <rows - 1; i ++) {
        UIView *divide = [[UIView alloc]init];
        divide.backgroundColor = [UIColor whiteColor];
        divide.frame = CGRectMake(0, (i + 1) * XCItemWH, self.frame.size.width, 1);
                        [self addSubview:divide];
    }
}
-(void)setUpAllButtons
{
    for (XCItems *items in self.item) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:items.title forState:UIControlStateNormal];
        [button setImage:items.image forState:UIControlStateNormal];
        
        [self addSubview:button];
        
        [self.Mitems addObject:button];
    }
}
#pragma mark - 布局子控件位置
-(void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger col = 0 ;
    NSInteger row = 0 ;
    CGFloat x = 0 ;
    CGFloat y = 0 ;
    NSUInteger count = self.item.count;
    
    for (NSInteger i = 0; i <count; i++) {
        col = i % XCcols ;
        row = i / XCcols ;
        x = col * XCItemWH;
        y = row * XCItemWH;
        UIButton *button = self.Mitems[i];
        button.frame = CGRectMake(x, y, XCItemWH, XCItemWH);
    }
}
@end
