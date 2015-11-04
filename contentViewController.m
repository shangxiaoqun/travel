//
//  contentViewController.m
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/11/4.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import "contentViewController.h"
#import "UIImageView+AFNetworking.h"
@interface contentViewController ()

@end

@implementation contentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *contantDef = [NSUserDefaults standardUserDefaults];
    NSString *content = [contantDef valueForKey:@"infoContant"];
    NSString *image =[contantDef valueForKey:@"img"];
    self.textView.text=content;
    [self.textImage  setImageWithURL:[NSURL URLWithString:image]];

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

- (IBAction)stopClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"close");
    }];

}
@end
