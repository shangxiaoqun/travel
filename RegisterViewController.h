//
//  RegisterViewController.h
//  乌鸡旅游1.0.1
//
//  Created by 郝慧 on 15/10/29.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MBProgressHUD.h"
@interface RegisterViewController : ViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundGif;
@property (weak, nonatomic) IBOutlet UITextField *againPassword;
@property (weak, nonatomic) IBOutlet UIButton *validateCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *email;
- (IBAction)registerNum:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *telphone;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *message;



@end
