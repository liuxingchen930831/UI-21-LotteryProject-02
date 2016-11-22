//
//  XCNewFeatureCell.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/18.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCNewFeatureCell : UICollectionViewCell
@property(nonatomic,strong)UIImage * image ;
-(void)setUpIndexPath:(NSIndexPath* )indexPath count:(NSInteger )page;
@end
