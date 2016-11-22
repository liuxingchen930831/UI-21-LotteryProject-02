//
//  XCNewFeatureViewController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/18.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCNewFeatureViewController.h"

#import "XCNewFeatureCell.h"
@interface XCNewFeatureViewController ()

@property (nonatomic, assign) CGFloat lastOffsetX;

@property (nonatomic, weak) UIImageView *guideView;

@property (nonatomic, weak) UIImageView *guideLargetView;

@property (nonatomic, weak) UIImageView *guideSmallView;

@end

@implementation XCNewFeatureViewController

static NSString * const ID = @"cellID";

// UICollectionViewController层次结构：控制器View 上面UICollectionView
// self.view != self.collectionView

// 1.初始化的时候必须设置布局参数，通常使用系统提供的流水布局UICollectionViewFlowLayout

// 2.cell必须通过注册
-(instancetype)init
{
    // 流水布局对象,设置cell的尺寸和位置
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    // 设置每一个cell的尺寸
    layout.itemSize = XCScreenBouns.size;
    //设置cell的滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置每一个cell之间的间距
    layout.minimumInteritemSpacing = 0;
    //设置每一行cell行距
    layout.minimumLineSpacing = 0;
//    //设置每一组的内间距
//    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    return  [super initWithCollectionViewLayout:layout];
}

#pragma mark-返回Section组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

#pragma mark-返回collectionView有多少组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
#pragma mark-返回UICollectionViewCell什么样式
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   XCNewFeatureCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    NSString *imageString = [NSString stringWithFormat:@"guide%ldBackground",indexPath.row +1];
    cell.image = [UIImage imageNamed:imageString];
    
    [cell setUpIndexPath:indexPath count:4];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[XCNewFeatureCell class] forCellWithReuseIdentifier:ID];
    self.collectionView.backgroundColor =[UIColor yellowColor];
    //关闭弹簧效果
    self.collectionView.bounces = NO;
    //关闭水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //开启分页
    self.collectionView.pagingEnabled = YES;
    [self setUpChildView];
}
-(void)setUpChildView
{
    UIImageView * guide = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    guide.centerX = self.view.centerX;
    [self.collectionView addSubview:guide];
    _guideView = guide;
    
    UIImageView * guideLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    [self.collectionView addSubview:guideLine];
    
    
    UIImageView * largerText = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largerText.center = CGPointMake(self.view.center.x+20, self.view.center.y+50);
    [self.collectionView addSubview:largerText];
    _guideLargetView = largerText;
    
    
    UIImageView * smallText = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    
    smallText.center = CGPointMake(self.view.center.x+20, self.view.center.y+100);
    [self.collectionView addSubview:smallText];
    _guideSmallView = smallText;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取当前的偏移量
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    
    //获取当前的差值
    CGFloat delta = currentOffsetX - self.lastOffsetX;
    self.guideView.x += 2 *delta;
    self.guideLargetView.x += 2 *delta;
    self.guideSmallView.x += 2 *delta;
    [UIView animateWithDuration:0.25 animations:^{
        self.guideView.x -= delta;
        self.guideLargetView.x -= delta;
        self.guideSmallView.x  -= delta;
    }];
    int page = currentOffsetX / self.view.width + 1;
    
    // 修改控件的内容
    _guideView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d",page]];
    _guideSmallView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%d",page]];
    _guideLargetView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%d",page]];
    _lastOffsetX = currentOffsetX;
}
@end
