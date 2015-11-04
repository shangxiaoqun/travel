//
//  WelcomeViewController.h
//  乌鸡旅游1.0.1
//
//  Created by 郝慧 on 15/10/29.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "ViewController.h"

@interface WelcomeViewController : ViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundGif;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *userName;
- (IBAction)didLogin:(UIButton *)sender;

@end
