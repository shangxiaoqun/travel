//
//  TacticViewController.m
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/11/2.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import "TacticViewController.h"
#import "TContentViewController.h"
#define API_HTTP @"http://apis.baidu.com/qunartravel/travellist/travellist"
#define API_KEY @"1a604b539fd148ffab795c3c5f48c7e2"

@interface TacticViewController ()
{
    AFHTTPRequestOperationManager *manager;
    BOOL result;
}

@property (nonatomic,strong) NSMutableArray *tacticDataArray;

@end

@implementation TacticViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    //创建数据
    manager = [AFHTTPRequestOperationManager manager];
    _tacticDataArray = [[NSMutableArray alloc] init];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个元素的尺寸
    [layout setItemSize:CGSizeMake(145, 145)];
    [layout setMinimumLineSpacing:5];
    [layout setMinimumInteritemSpacing:5];
    
    CGRect frame = CGRectMake(0, 20, 320, 560);
    
    _viewController = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    
    _viewController.dataSource = self;
    _viewController.delegate = self;
    
    _viewController.backgroundColor = [UIColor whiteColor];
    
    UINib *nib = [UINib nibWithNibName:@"tacticCollectionViewCell" bundle:nil];
    
    [_viewController registerNib:nib forCellWithReuseIdentifier:@"CollectionViewCell"];
    [self.view addSubview:_viewController];

    [self loadMessageWithKeywords];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)collectionShow
{/*
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个元素的尺寸
    [layout setItemSize:CGSizeMake(145, 145)];
    [layout setMinimumLineSpacing:5];
    [layout setMinimumInteritemSpacing:5];
    
    CGRect frame = CGRectMake(0, 20, 320, 560);
    
    _viewController = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    
    _viewController.dataSource = self;
    _viewController.delegate = self;
    
    _viewController.backgroundColor = [UIColor whiteColor];
    
    UINib *nib = [UINib nibWithNibName:@"tacticCollectionViewCell" bundle:nil];

    [_viewController registerNib:nib forCellWithReuseIdentifier:@"CollectionViewCell"];
    
    [self.view addSubview:_viewController];*/
    [self.viewController reloadData];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _tacticDataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    tacticCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    //增加选中时的样式
    UIView *view = [[UIView alloc]initWithFrame:cell.bounds];
    view.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = view;
  //指定要显示的数据模型 M
    tacticMessage *tac=_tacticDataArray[indexPath.row];
    [cell setMessage:tac];

    
    return cell;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (BOOL) loadMessageWithKeywords
{
    //创建数据
    NSDictionary *dict = @{
                           @"query":@"嘉兴",
                           };
    [manager.requestSerializer  setValue:API_KEY forHTTPHeaderField:@"apikey"];
    
    [manager GET:API_HTTP parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        //获取数据
        NSDictionary *data = [responseObject valueForKey:@"data"];
        //准备数据模型
        NSArray *list = [data valueForKey:@"books"];
        _tacticDataArray = [tacticMessage objectArrayWithKeyValuesArray:list];
        
         [self collectionShow];
    
        //if (_tacticDataArray) {
            result=YES;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"->>>>>>>>>>>%@",error);
        result=NO;
    }];
  
    return result;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    int index = indexPath.row;
    NSString * url = [_tacticDataArray[index] valueForKey:@"bookUrl"];
    [def setValue:url forKey:@"url"]
    ;
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TContentViewController * nextView = [story instantiateViewControllerWithIdentifier:@"TContent"];
    [self presentViewController:nextView animated:YES completion:nil];
    
}

@end
