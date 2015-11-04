//
//  domesticViewController.m
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/10/31.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import "domesticViewController.h"
#import "domesticMessage.h"
#import "MessageTableViewCell.h"
#import "infoViewController.h"
#define API_HTTP @"http://api2.juheapi.com/xiecheng/linercruise/product/search"
#define API_KEY @"bdeb59130e0ab6f82ac3bd7afd1162f9"

@interface domesticViewController ()
{
    AFHTTPRequestOperationManager *manager;

}

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation domesticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //tableView
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight  = 150;
    
    [self.view addSubview:_tableView];
//创建数据
    manager = [AFHTTPRequestOperationManager manager];
    _dataArray = [[NSMutableArray alloc] initWithCapacity:10];

    [self loaddomesticWithKeywords];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //指定要显示的Cell V
    MessageTableViewCell *cell = [[MessageTableViewCell alloc] init];
    //指定要显示的新闻数据模型 M
    [cell setDMessage:_dataArray[indexPath.row]];
    return cell;
}


//请求数据方法
- (void) loaddomesticWithKeywords
{
    //组合URL 宏定义
    //获取AFnetworking框架单例对象
    //组合参数
    NSDictionary *dict;
    for (int i=1; i<10; i++) {
    dict = @{@"pageindex":@'i',
                @"pagesize":@10,
                @"direction":@"false",
                @"key":API_KEY
                };
        
    
    
    [manager GET:API_HTTP parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
        //获取数据
        NSDictionary *data = [responseObject valueForKey:@"result"];
        //准备数据模型
        NSArray *list = [[[data valueForKey:@"VoyaProductSearchResponse"] valueForKey:@"ProductList"] valueForKey:@"ProductSearchResponseDTO"];
        NSDictionary * dic = [list[i]  valueForKey:@"DescInfo"];
        domesticMessage *domes = [domesticMessage objectWithKeyValues:dic];
        [_dataArray addObject:domes];
        [self.tableView reloadData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"->>>>>>>>>>>%@",error);
    }];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    int index = indexPath.row;
    NSString * url = [_dataArray[index] valueForKey:@"ProductDetailURL"];
    [def setValue:url forKey:@"infoUrl"];
    NSLog(@"---------------------%@",url);
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    infoViewController * nextView = [story instantiateViewControllerWithIdentifier:@"IContent"];
    [self presentViewController:nextView animated:YES completion:nil];
    
}

@end
