//
//  XCLotteryViewController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/1.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCLotteryViewController.h"
#import "XCSettingController.h"
@interface XCLotteryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation XCLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIButton的图片拉伸只能用纯代码写，只有UIImAageView可以在storyBoard中实现
    UIImage * image =self.loginButton.currentBackgroundImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width *0.5 topCapHeight:image.size.height *0.5];
    [self.loginButton setBackgroundImage:image forState:UIControlStateNormal];
    [self setUpNav];
}
-(void)setUpNav
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"客服" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    //自适应尺寸
    [button sizeToFit];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithOriginalRenderingImage:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
}
-(void)setting
{
    XCSettingController *vc = [[XCSettingController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
