//
//  XCHelpViewController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/23.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCHelpViewController.h"
#import "XCHelpItem.h"
#import "XCHtmlViewController.h"
#import "XCNavigationController.h"
@interface XCHelpViewController ()
/** 模型数组 */
@property(nonatomic,strong)NSMutableArray * items ;

@end

@implementation XCHelpViewController

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
-(NSMutableArray *)items
{
    if (_items ==nil) {
        _items =[NSMutableArray array];
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"help.json" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        //解析json
       NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

        for (NSDictionary *dict in jsonArray) {
            XCHelpItem *item = [XCHelpItem itemWithDict:dict];
            [_items addObject:item];
        }
    }
    return _items;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"帮助";
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"helpCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    XCHelpItem *item = self.items[indexPath.row];
    cell.textLabel.text = item.title;
    return cell; 
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XCHelpItem *item = self.items[indexPath.row];
    XCHtmlViewController *vc = [[XCHtmlViewController alloc]init];
    
    vc.title = item.title;
    vc.htmlItem = item;
    XCNavigationController *nav = [[XCNavigationController alloc]initWithRootViewController:vc];
    
    
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}
@end
