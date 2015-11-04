//
//  PersonInfoViewController.m
//  乌鸡旅游1.0.1
//
//  Created by 郝慧 on 15/11/2.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "PersonInfoViewController.h"

@interface PersonInfoViewController ()

@end

@implementation PersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_userMessage resignFirstResponder];
    [_userAge resignFirstResponder];
    [_userName resignFirstResponder];
    [_userSex resignFirstResponder];
}
- (IBAction)infoOK:(id)sender {
    
    NSString *name = _userName.text;
    NSString *age = _userAge.text;
    NSString *sex = _userSex.text;
  
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [NSDictionary  dictionaryWithObjects:@[name,age,sex] forKeys:@[@"name",@"age",@"sex"]];
    [def setValue:dict forKey:@"dict"];
    NSLog(@"%@",def);
    
}
@end
