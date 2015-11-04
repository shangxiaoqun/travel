//
//  TContentViewController.m
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/11/3.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import "TContentViewController.h"

@interface TContentViewController ()

@end

@implementation TContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    NSString *url = [def valueForKey:@"url"];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [_TWebView loadRequest:request];
    
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
