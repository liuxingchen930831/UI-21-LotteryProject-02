//
//  XCArenaViewController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/1.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCArenaViewController.h"

@interface XCArenaViewController ()

@end

@implementation XCArenaViewController

-(void)loadView
{
    UIImageView *image = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    image.image = [UIImage imageNamed:@"NLArenaBackground"];
    image.userInteractionEnabled = YES;
    self.view = image;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"足球",@"篮球"]];
    seg.width +=60;
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    //默认选中哪个seg
    seg.selectedSegmentIndex = 0;
    seg.tintColor = XCColor(0, 142, 143);
    //设置字符串富文本
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [seg setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    self.navigationItem.titleView = seg;
    
}
@end
