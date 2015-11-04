//
//  WelcomeViewController.m
//  乌鸡旅游1.0.1
//
//  Created by 郝慧 on 15/10/29.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "WelcomeViewController.h"
#import "MBProgressHUD.h"
#define mainSize    [UIScreen mainScreen].bounds.size

const NSString *basePath = @"http://172.16.3.237";

//登陆状态
typedef NS_ENUM(NSInteger, LoginType) {
    Login_NONE,//无状态，初始化的状态
    Login_USER,//用户名
    Login_PASS //密码
};

@interface WelcomeViewController ()<NSURLConnectionDataDelegate,MBProgressHUDDelegate,UITextFieldDelegate>

{
    LoginType type;
}
@property (nonatomic,strong) MBProgressHUD *HUD;
@property (nonatomic,strong) NSMutableData *data;

@end


@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self didLaunchScreen];
    [self personInfo];
    self.title = @"登录";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark    背景
-(void)didLaunchScreen
{
  
    //创建一个可变数组用于存放图片
    NSMutableArray *muArr = [NSMutableArray array];
    //循环拿图片
    for (int i = 1 ; i<7; i++) {
        //组合出图片的名字
        NSString *imgName =
        [NSString stringWithFormat:@"0%i",i];
        //创建图片
        UIImage *image = [UIImage imageNamed:imgName];
        //添加到图片的数组
        [muArr addObject:image];
    }
    
    //图片组根据可变数组赋值
    _backgroundGif.animationImages = muArr;
    //动画的执行次数->0无限次
    _backgroundGif.animationRepeatCount = 0;
    //动画执行的时间=0.1*总的图片数
    _backgroundGif.animationDuration = 0.1*6;
    //开始动画
    [_backgroundGif startAnimating];
    

}
#pragma 隐藏键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_userName resignFirstResponder];
    [_passwordText resignFirstResponder];
    
}
- (IBAction)didLogin:(UIButton *)sender {
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    
    
    NSString *username = _userName.text ;
    
    NSString *password = _passwordText.text ;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?action=login&func=userLogin",basePath]];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    
    [urlRequest setHTTPMethod:@"POST"];
    
    NSString *str = [NSString stringWithFormat:@"&userName=%@&userPassword=%@",username,password];
    
    NSData *bodyData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    [urlRequest setHTTPBody:bodyData];
    
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
    [connection start];
    _HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _HUD.delegate = self;
    
}
#pragma mark - ConnectionDelegate
long long expectedLength,currentLength;
#pragma mark 请求开始
- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response
{
    //先拿到文件的长度
    expectedLength = MAX([response expectedContentLength], 1);
    //设置初始长度
    currentLength = 0;
    _HUD.mode = MBProgressHUDModeDeterminate;
    self.data = [[NSMutableData alloc]initWithCapacity:10];
    
    return request;
}

#pragma mark 收到数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
    currentLength += [data length];
    _HUD.progress = currentLength / (float)expectedLength;
}

#pragma mark 请求成功
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    //数据解析成JSON
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableLeaves error:nil];
    
    //判断登录状态
    if ([[dict valueForKey:@"code"] isEqualToNumber:@1]) {
        //登陆成功
        NSDictionary *userDict = dict[@"message"][0];
        NSString *name = [userDict valueForKey:@"buyer_name"];
        
        _HUD.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
        _HUD.labelText = [NSString stringWithFormat:@"登录成功^ ^%@",name];
        _HUD.mode = MBProgressHUDModeCustomView;
        //        [_HUD show:YES];
        [_HUD hide:YES afterDelay:3];
        
    }else{
        
        NSString *message = dict[@"message"];
        //        _HUD = [[MBProgressHUD alloc]initWithView:self.view];
        _HUD.labelText = [NSString stringWithFormat:@"登录失败：%@",message];
        _HUD.mode = MBProgressHUDModeText;
        [self.view addSubview:_HUD];
        //        [_HUD show:YES];
        [_HUD hide:YES afterDelay:3];
    }
    
}

#pragma mark 请求失败方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _HUD.labelText = @"请求失败";
    _HUD.mode = MBProgressHUDModeText;
    [_HUD show:YES];
    [_HUD hide:YES afterDelay:3];
}

-(void)personInfo
{
    NSString *telphone = _userName.text;
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSDictionary *diction = [NSDictionary  dictionaryWithObjects:@[telphone] forKeys:@[@"telphone"]];
    [def setValue:diction forKey:@"diction"];
    


}

@end
