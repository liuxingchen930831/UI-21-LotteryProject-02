//
//  XCHallViewController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/1.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCHallViewController.h"
#import "XMGCover.h"
#import "XMGActiveMenu.h"
#import "XCDownView.h"
#import "XCItems.h"
@interface XCHallViewController ()<XMGActiveMenuDelegate>
@property(nonatomic,assign)BOOL isMenuPop;
/** 菜单 */
@property(nonatomic,weak)XCDownView * downView ;
@end

@implementation XCHallViewController

-(XCDownView *)downView
{
    if (_downView == nil) {
        XCItems *item0 = [XCItems itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        XCItems *item1 = [XCItems itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        XCItems *item2 = [XCItems itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        XCItems *item3 = [XCItems itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        XCItems *item4 = [XCItems itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        XCItems *item5 = [XCItems itemWithImage:[UIImage imageNamed:@"Development"] title:nil];
        _downView = [XCDownView showshowInView:self.view items:@[item0,item1,item2,item3,item4,item5] oriY:0];
    }
    return _downView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
}
-(void)setUpNav
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithOriginalRenderingImage:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(active)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithOriginalRenderingImage:@"Development"] style:UIBarButtonItemStylePlain target:self action:@selector(popMenu)];
}
-(void)popMenu
{
    if (self.isMenuPop == NO) {
        [self downView];
    }else{
        [self.downView hide];
        
    }
    _isMenuPop = !_isMenuPop;
    
}
-(void)active
{
    [XMGCover show];
    XMGActiveMenu *menu = [XMGActiveMenu showInPoint:self.view.center];
    menu.delegate = self;
}
-(void)activeMenuDidClickCloseBtn:(XMGActiveMenu *)menu
{
    
    
    [XMGActiveMenu hideInPoint:CGPointMake(44, 44) completion:^{
        [XMGCover hide];
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
