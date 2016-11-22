//
//  XCArenaNavigation.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/15.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCArenaNavigation.h"

@interface XCArenaNavigation ()

@end

@implementation XCArenaNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
}
+(void)initialize
{
    // 获取当前类下面的所有导航条去设置
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];
   image =  [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
@end
