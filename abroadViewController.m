//
//  abroadViewController.m
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/10/31.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import "abroadViewController.h"
#import "abroadMessage.h"
#import "MessageTableViewCell.h"
#import "contentViewController.h"
#define API_HTTP @"http://apis.haoservice.com/lifeservice/travel/GetScenery"
#define API_KEY @"fcb2d816a1684edcbe2ad0433304932"

@interface abroadViewController ()
{
    AFHTTPRequestOperationManager *manager;
    
}
@property (nonatomic,strong) UITableView *AtableView;
@property (nonatomic,strong) NSMutableArray *AdataArray;
@end

@implementation abroadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _AtableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _AtableView.delegate = self;
    _AtableView.dataSource = self;
    _AtableView.rowHeight  = 150;
    [self.view addSubview:_AtableView];
    //创建数据
    _AdataArray = [[NSMutableArray alloc] initWithCapacity:10];
    manager = [AFHTTPRequestOperationManager manager];
    [self loadabroadWithKeywords];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _AdataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //指定要显示的Cell V
    MessageTableViewCell *cell = [[MessageTableViewCell alloc] init];
    //指定要显示的新闻数据模型 M
    [cell setAMessage:_AdataArray[indexPath.row]];
    return cell;
}


//请求数据方法
- (void) loadabroadWithKeywords
{
    //组合URL 宏定义
    //获取AFnetworking框架单例对象
    //组合参数
    
    NSDictionary *dict = @{@"sid":@191872,
                           @"key":API_KEY
             };
    //[manager.requestSerializer setValue:API_KEY forHTTPHeaderField:@"apikey"];
    [manager GET:API_HTTP parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        //获取数据
        _AdataArray = [responseObject valueForKey:@"result"];
        //准备数据模型
        //abroadMessage *abroad = [abroadMessage objectWithKeyValues:data];
        _AdataArray=[abroadMessage objectArrayWithKeyValuesArray:_AdataArray];
        
        [self.AtableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"->>>>>>>>>>>%@",error);
    }];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUserDefaults * contantDef = [NSUserDefaults standardUserDefaults];
    int index = indexPath.row;
    NSString *content = [_AdataArray[index] valueForKey:@"referral"];
    NSString *image=[_AdataArray[index]valueForKey:@"img"];
    [contantDef setValue:content forKey:@"infoContant"];
    [contantDef setValue:image forKey:@"img"];
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    contentViewController * nextView = [story instantiateViewControllerWithIdentifier:@"content"];
    [self presentViewController:nextView animated:YES completion:nil];
    
}

@end
