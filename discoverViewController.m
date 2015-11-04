//
//  discoverViewController.m
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/10/30.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import "discoverViewController.h"
#import "abroadViewController.h"
#import "domesticViewController.h"

@interface discoverViewController ()
{
    abroadViewController *abroad;
    domesticViewController*domestic;
    

}
@property (strong, nonatomic) UIViewController *currentVC;
@end

@implementation discoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    abroad = [story instantiateViewControllerWithIdentifier:@"abroad"];
    domestic = [story instantiateViewControllerWithIdentifier:@"domestic"];
    [self addChildViewController:abroad];
    [self addChildViewController:domestic];
    [self.scrollView addSubview:abroad.view];
    self.currentVC = abroad;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)selectRecommend:(id)sender {
    UIViewController *oldVC = self.currentVC;
    if(self.currentVC==abroad && [sender tag]==1) {
        return;
    }
    
    if(self.currentVC==domestic && [sender tag]==2) {
        return;
    }
    
    switch ([sender tag]) {
        case 1: {
            [self transitionFromViewController:self.currentVC toViewController:abroad duration:1 options:UIViewAnimationOptionTransitionNone animations:^{
                
            } completion:^(BOOL finished) {
                if(finished) {
                    self.currentVC = abroad;
                    self.Abtn.backgroundColor =[UIColor colorWithRed:0 green:0.27 blue:0 alpha:1];
                    self.Abtn.titleLabel.textColor=[UIColor whiteColor];
                    
                    
                    self.Bbtn.backgroundColor=[UIColor whiteColor];
                    self.Bbtn.titleLabel.textColor=[UIColor blackColor];
                    }
                else {
                    self.currentVC = oldVC;
                }
            }];
        }
            break;
        case 2: {
            [self transitionFromViewController:self.currentVC toViewController:domestic duration:1 options:UIViewAnimationOptionTransitionNone animations:^{
                
            } completion:^(BOOL finished) {
                if(finished) {
                    self.currentVC = domestic;
                    
                    self.Bbtn.backgroundColor=[UIColor colorWithRed:0 green:0.27 blue:0 alpha:1];
                    self.Bbtn.titleLabel.textColor=[UIColor whiteColor];

                    self.Abtn.backgroundColor=[UIColor whiteColor];
                    self.Abtn.titleLabel.textColor=[UIColor blackColor];
                    
                }
                else {
                    self.currentVC = oldVC;
                }
            }];
        }
            break;
            default:
            break;
    }
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
