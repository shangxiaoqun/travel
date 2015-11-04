//
//  TacticViewController.h
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/11/2.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tacticMessage.h"
#import "tacticCollectionViewCell.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MJExtension.h"
@interface TacticViewController : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *viewController;//?

@end
