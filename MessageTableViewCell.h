//
//  MessageTableViewCell.h
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/10/31.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "domesticMessage.h"
#import "abroadMessage.h"
//管理界面的东西
@interface MessageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;



//管理数据
@property (strong,nonatomic) domesticMessage *DMessage;
@property (strong,nonatomic) abroadMessage *AMessage;

- (void)setDMessage:(domesticMessage *)DMessage;
- (void)setAMessage:(abroadMessage*)AMessage;
@end
