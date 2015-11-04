//
//  tacticCollectionViewCell.m
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/11/2.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import "tacticCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation tacticCollectionViewCell

//- (instancetype) init
//{
//    self = [super init];
//    if (self) {
//        return [[NSBundle mainBundle] loadNibNamed:@"tacticCollectionViewCell" owner:nil options:nil][0];
//    }
//    return nil;
//    
//    
//}
- (void)setMessage:(tacticMessage*)message
{

    _message = message;
   [self.tacticImageView setImageWithURL:[NSURL URLWithString: message.headImage]];
    self.tacticLable.text = [message title];
    
}


@end
