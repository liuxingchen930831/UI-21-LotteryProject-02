//
//  XCLuckyViewController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/17.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCLuckyViewController.h"

@interface XCLuckyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *lightImage;

@end

@implementation XCLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //image动画组，可以实现简单额动画，原理就是来回切换图片
    UIImage *image = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image1 =[UIImage imageNamed:@"lucky_entry_light1"];
    self.lightImage.animationImages = @[image,image1];
    self.lightImage.animationDuration = 1;
    [self.lightImage startAnimating];
}
@end
