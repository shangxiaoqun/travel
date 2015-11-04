//
//  MessageTableViewCell.m
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/10/31.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation MessageTableViewCell


- (void)layoutSubviews
{
    [super layoutSubviews];
}


- (instancetype) init
{
    self = [super init];
    if (self) {
        return [[NSBundle mainBundle] loadNibNamed:@"MessageTableViewCell" owner:nil options:nil][0];
    }
    return nil;
    
    
}



//把模型数据设置到界面上
- (void)setDMessage:(domesticMessage *)DMessage
{
    //初始化邮轮数据
    _DMessage = DMessage;
    [self.ImageView setImageWithURL:[NSURL URLWithString: DMessage.ProductImageURL ]];
    self.titleLabel.text = [DMessage VoyaRangeName];
    self.contentLabel.text =[DMessage DestinationPort];
}

- (void)setAMessage:(abroadMessage*)AMessage
{
    //初始化国内景点数据
    _AMessage = AMessage;
    NSURL *url=[NSURL URLWithString:AMessage.img];
    [self.ImageView setImageWithURL:url];
    self.titleLabel.text = [AMessage title];
    self.contentLabel.text =[AMessage referral];
}


@end
