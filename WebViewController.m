//
//  WebViewController.m
//  乌鸡旅游1.0.1
//
//  Created by 郝慧 on 15/11/3.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://travel.qunar.com/?from=header"]];
    [_webView loadRequest:request];
    self.title = @"心仪旅程";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
