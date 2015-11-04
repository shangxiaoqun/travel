//
//  tacticCollectionViewCell.h
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/11/2.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tacticMessage.h"
@interface tacticCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *tacticImageView;

@property (weak, nonatomic) IBOutlet UILabel *tacticLable;
@property (strong,nonatomic) tacticMessage *message;
- (void)setMessage:(tacticMessage*)message;


@end
