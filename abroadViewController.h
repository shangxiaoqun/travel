//
//  abroadViewController.h
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/10/31.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "abroadMessage.h"
#import "MessageTableViewCell.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MJExtension.h"

@interface abroadViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (void) loadabroadWithKeywords;
@end
