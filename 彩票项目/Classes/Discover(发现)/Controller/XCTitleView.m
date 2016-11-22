
//
//  XCTitleView.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/17.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCTitleView.h"

@implementation XCTitleView

-(void)layoutSubviews
{
    [super layoutSubviews];
    if (self.titleLabel.x < self.imageView.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
    
}
@end
