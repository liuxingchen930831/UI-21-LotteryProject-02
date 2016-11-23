//
//  XCHtmlViewController.m
//  彩票项目
//
//  Created by liuxingchen on 16/11/23.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCHtmlViewController.h"

@interface XCHtmlViewController ()<UIWebViewDelegate>

@end

@implementation XCHtmlViewController
-(void)loadView
{
    self.view = [[UIWebView alloc]initWithFrame:XCScreenBouns];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    UIWebView *webView = (UIWebView *)self.view;
#pragma mark -方法一 加载本地url
//    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"help.html" ofType:nil];
//    //如果路径中有中文，必须转换下百分号,通常用UTF8转中文
//    filePath = [filePath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *url = [NSURL URLWithString:filePath];
//    NSLog(@"%@",url);
//    //创建请求
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
#pragma mark -方法二 接在本地url
    NSURL *url =[[NSBundle mainBundle]URLForResource:self.htmlItem.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    webView.delegate = self;
}
//加载完成时调用
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //window.location.href = '#‘; 是js代码
    NSString *jsStr = [NSString stringWithFormat:@"window.location.href = '#%@';",self.htmlItem.ID];
    [webView stringByEvaluatingJavaScriptFromString:jsStr];
    NSLog(@"%s, line = %d",__FUNCTION__,__LINE__);
}
-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
