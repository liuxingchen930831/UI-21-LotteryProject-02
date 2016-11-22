//
//  XCDownView.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/9.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCDownView : UIView
+(instancetype)showshowInView:(UIView *)superView items:(NSArray *) itmes oriY:(CGFloat)oriY;
/**
 *  移除所有子控件
 */
-(void)hide;
@end
