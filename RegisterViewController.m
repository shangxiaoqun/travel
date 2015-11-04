//
//  RegisterViewController.m
//  乌鸡旅游1.0.1
//
//  Created by 郝慧 on 15/10/29.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "RegisterViewController.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MBProgressHUD.h"


#define basePath @"http://172.16.3.237/"
@interface RegisterViewController ()<MBProgressHUDDelegate>

{
    MBProgressHUD *HUD;
    AFHTTPRequestOperationManager *AFManager;
    NSTimer *timer;

}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self didShowBackground];
    [self networkingStatus];
    HUD = [[MBProgressHUD alloc]initWithView:self.view];
    HUD.delegate = self;
    [self.view addSubview:HUD];
    AFManager=[AFHTTPRequestOperationManager manager];
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
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_message resignFirstResponder];
    [_password resignFirstResponder];
    [_telphone resignFirstResponder];
    [_email resignFirstResponder];
    [_againPassword resignFirstResponder];
    
}

-(void)didShowBackground
{
    
    //创建一个可变数组用于存放图片
    NSMutableArray *muArr = [NSMutableArray array];
    //循环拿图片
    for (int i = 1 ; i<8; i++) {
        //组合出图片的名字
        NSString *imgName =
        [NSString stringWithFormat:@"00%i",i];
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
    _backgroundGif.animationDuration = 0.15*8;
    //开始动画
    [_backgroundGif startAnimating];
    
    
}

- (IBAction)sendValidate:(id)sender {
    
 }



#pragma mark 校验用户信息是否正常
- (BOOL) validateUserinfo
{
    NSString *passwordText = self.password.text;
    NSString *confirmText = self.againPassword.text;
    if ([passwordText isEqualToString:@""]) {
        HUD.mode =MBProgressHUDModeText;
        HUD.labelText = @"密码输入不正确";
        [HUD show:YES];
        [HUD hide:YES afterDelay:3];
        return NO;
    }
    if (![passwordText isEqualToString:confirmText]) {
        HUD.mode =MBProgressHUDModeText;
        HUD.labelText = @"两次密码不一致";
        [HUD show:YES];
        [HUD hide:YES afterDelay:3];
        return NO;
    }
    return YES;
    
}

//当隐藏HUD时进行移除
-(void)hudWasHidden:(MBProgressHUD *)hud
{
    
    [HUD removeFromSuperview];
    HUD = nil;
}

#pragma mark 判断是否有网络
- (BOOL) networkingStatus
{
    //测试网络地址
    NSURL *url = [NSURL URLWithString:basePath];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
    
    [[manager reachabilityManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusNotReachable) {
            NSLog(@"断网了");
        }else if(status == AFNetworkReachabilityStatusReachableViaWiFi)
        {
            NSLog(@"WiFi");
        }else if(status == AFNetworkReachabilityStatusReachableViaWWAN)
        {
            NSLog(@"移动网络");
        }else{
            NSLog(@"未知网络");
        }
    }];
    //启动
    [[manager reachabilityManager] startMonitoring];
    return YES;
}

- (IBAction)registerNum:(id)sender {
    NSString *uText = self.telphone.text;
    if ([uText isEqualToString:@""]||uText.length != 11) {
        
        HUD.mode = MBProgressHUDModeText;
        HUD.labelText = @"请输入正确的手机号码";
        [HUD show:YES];
        [HUD hide:YES afterDelay:3];
        //变成第一响应者
        [self.telphone becomeFirstResponder];
        return;
    }
    //设定验证码框不能被点击
    self.validateCodeBtn.enabled = NO;
    
    //增加60秒提示
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(sub) userInfo:nil repeats:YES];
    
    NSString *username = _telphone.text;
    NSString *userPassword = _password.text;
    NSString *userEmail = _email.text;
    NSString *url =[basePath stringByAppendingFormat:@"?action=login&func=userRegister&userName=%@&&userPassword=%@&&userEmail=%@",username,userPassword,userEmail];
    
//    NSString *code = self.message.text;
//    if (code.length != 6) {
//        HUD.mode = MBProgressHUDModeText;
//        HUD.labelText = @"请输入正确的验证码";
//        [HUD show:YES];
//        [HUD hide:YES afterDelay:3];
//        //变成第一响应者
//        [self.message becomeFirstResponder];
//        return ;
//    }
    [AFManager GET:url
        parameters:nil
           success:^(AFHTTPRequestOperation *operation, id responseObject) {
               //提交注册信息
               if([self validateUserinfo])
               {
                   
                   NSDictionary *userinfo = @{@"userName":self.telphone.text,
                                              @"userPassword":self.password.text,
                                              @"userEmail":self.email.text};
                   
                  
                    [HUD setLabelText:@"注册成功"];
               }
               
             
           }
               
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [HUD setLabelText:@"注册失败"];
        NSLog(@"error%@",error);

    }];
    

}
@end


