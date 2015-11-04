//
//  PersonInfoViewController.h
//  乌鸡旅游1.0.1
//
//  Created by 郝慧 on 15/11/2.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "ViewController.h"

@interface PersonInfoViewController : ViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userSex;
@property (weak, nonatomic) IBOutlet UITextField *userAge;
@property (weak, nonatomic) IBOutlet UITextField *userMessage;
- (IBAction)infoOK:(id)sender;

@end
