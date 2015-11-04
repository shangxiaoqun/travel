//
//  PersonViewController.h
//  乌鸡旅游1.0.1
//
//  Created by 郝慧 on 15/11/1.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "ViewController.h"

@interface PersonViewController : ViewController
@property (weak, nonatomic) IBOutlet UIImageView *magicPic;
@property (weak, nonatomic) IBOutlet UIView *anotherView;
@property (weak, nonatomic) IBOutlet UILabel *nameForUser;

- (IBAction)magicBtn:(UIButton *)sender;
//- (IBAction)didHideView:(id)sender;

@end
