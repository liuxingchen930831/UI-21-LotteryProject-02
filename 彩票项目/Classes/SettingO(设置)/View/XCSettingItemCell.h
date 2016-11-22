//
//  XCSettingItemCell.h
//  彩票项目
//
//  Created by liuxingchen on 16/11/22.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCSettingItem;
@interface XCSettingItemCell : UITableViewCell
@property(nonatomic,strong)XCSettingItem * item ;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
