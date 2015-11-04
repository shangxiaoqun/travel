//
//  discoverViewController.h
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/10/30.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface discoverViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *btnView;
@property (weak, nonatomic) IBOutlet UIButton *Abtn;
@property (weak, nonatomic) IBOutlet UIButton *Bbtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)selectRecommend:(id)sender;
@end
