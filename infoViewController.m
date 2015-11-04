//
//  infoViewController.m
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/11/3.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import "infoViewController.h"

@interface infoViewController ()

@end

@implementation infoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    NSString *url = [def valueForKey:@"infoUrl"];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [_infoView loadRequest:request];
    
    
    

    NSString *urls = [def valueForKey:@"infoAUrl"];
    NSURLRequest * requests = [NSURLRequest requestWithURL:[NSURL URLWithString:urls]];
    [_infoView loadRequest:requests];
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
