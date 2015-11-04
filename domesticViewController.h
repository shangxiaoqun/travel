//
//  domesticViewController.h
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/10/31.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "domesticMessage.h"
#import "MessageTableViewCell.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MJExtension.h"
@interface domesticViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (void) loaddomesticWithKeywords;
@end
