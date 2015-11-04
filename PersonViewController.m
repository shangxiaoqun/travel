//
//  PersonViewController.m
//  乌鸡旅游1.0.1
//
//  Created by 郝慧 on 15/11/1.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "PersonViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tailorPicture];
    _anotherView.hidden = YES;
   
    // Do any additional setup after loading the view.
}
- (void) viewWillAppear:(BOOL)animated
{
     [self didShowUserName];
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

    



- (IBAction)magicBtn:(UIButton *)sender {
    [self newViewDidShow];   // show the newView when click
    [self newViewBeginAction];
    
}

- (IBAction)didHideView:(id)sender {
    _anotherView.hidden = YES;   // hide the newView when click
}

#pragma mark 裁剪图片为圆
-(void)tailorPicture
{
    //set borderWidth
    _magicPic.layer.borderWidth = 5;
    //set borderColor
    _magicPic.layer.borderColor = [[UIColor colorWithWhite:0.5 alpha:0.5] CGColor];
    //set cornerRadius
    _magicPic.layer.cornerRadius = 50;
    //tailorPicture
    _magicPic.layer.masksToBounds =  YES ;
//    //set borderWidth
//    _anotherView.layer.borderWidth = 5;
//    //set borderColor
//    _anotherView.layer.borderColor = [[UIColor colorWithWhite:0.5 alpha:0.5] CGColor];
//    //set cornerRadius
//    _anotherView.layer.cornerRadius = 80;
//    //tailorPicture
//    _anotherView.layer.masksToBounds =  YES ;
}
#pragma mark  弹出view

-(void)newViewDidShow
{

    _anotherView.hidden = NO;
}
#pragma mark  newView Animation
-(void)newViewBeginAction
{


       _anotherView.transform=CGAffineTransformMakeRotation(1);
    //首尾式动画
    [UIView beginAnimations:nil context:nil];
    //执行动画
    //设置动画执行时间
    [UIView setAnimationDuration:0.5];
    //设置代理
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(stopAnimat)];
    _anotherView.transform=CGAffineTransformMakeRotation(0);
        [UIView commitAnimations];
    
}
-(void)stopAnimat{

//    _anotherView.transform=CGAffineTransformMakeScale(0.5, 0.5);
    //首尾式动画
    [UIView beginAnimations:nil context:nil];
    //执行动画
    //设置动画执行时间
    [UIView setAnimationDuration:0.5];
    //设置代理
    [UIView setAnimationDelegate:self];
    _anotherView.transform=CGAffineTransformIdentity;
    [UIView commitAnimations];

}
-(void)didShowUserName
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dictionary = [defaults valueForKey:@"dict"];
//    NSDictionary *dict = [defaults valueForKey:@"diction"];
    _nameForUser.text = [dictionary valueForKey:@"name"];
}
@end
