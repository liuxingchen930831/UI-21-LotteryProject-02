//
//  XCNewFeatureCell.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/18.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCNewFeatureCell.h"
#import "XCTabBarController.h"
@interface XCNewFeatureCell ()
/**collection中的cell的contentView是UIView,所以可以添加任何控件*/
@property(nonatomic,weak)UIImageView  * imageView ;
/** 立即体验*/
@property(nonatomic,strong)UIButton  * startButton ;
@end
@implementation XCNewFeatureCell

-(UIButton *)startButton
{
    if (_startButton ==nil) {
        
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_startButton];
        
        [_startButton setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        [_startButton sizeToFit];
        _startButton.center = CGPointMake(self.width *0.5, self.height *0.8);
        
    }
    return _startButton;
}
-(UIImageView *)imageView
{
    if (_imageView ==nil) {
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:self.bounds];
        _imageView = imageV;
        [self.contentView addSubview:imageV];
    }
    return _imageView;
}
-(void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}
-(void)setUpIndexPath:(NSIndexPath* )indexPath count:(NSInteger )page
{
    if (indexPath.row == page-1) {
        self.startButton.hidden = NO;
    }else{
        self.startButton.hidden = YES;
    }
}
-(void)start
{
    //拿到主窗口的跟控制器跳转根控制器
    XCKeyWindow.rootViewController = [[XCTabBarController alloc]init];
    CATransition *anim = [CATransition animation];
    anim.type = @"suckeffect";
    anim.duration = 1.0;
    [XCKeyWindow.layer addAnimation:anim forKey:nil];
}
@end
