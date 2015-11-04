//
//  contentViewController.h
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/11/4.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *textImage;

- (IBAction)stopClick:(id)sender;

@end
