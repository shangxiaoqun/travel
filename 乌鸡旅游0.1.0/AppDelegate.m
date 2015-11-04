//
//  AppDelegate.m
//  乌鸡旅游0.1.0
//
//  Created by 尚笑群 on 15/10/29.
//  Copyright © 2015年 哇酷. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建一个可变数组用于存放图片
    NSMutableArray *muArr = [NSMutableArray array];
    //循环拿图片
    for (int i = 1 ; i<5; i++) {
        //组合出图片的名字
        NSString *imgName =
        [NSString stringWithFormat:@"m%i",i];
        //创建图片
        UIImage *image = [UIImage imageNamed:imgName];
        //添加到图片的数组
        [muArr addObject:image];

     [NSThread sleepForTimeInterval:5.0];
        UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 548)];
    
        //图片组根据可变数组赋值
        background.animationImages = muArr;
        //动画的执行次数->0无限次
        background.animationRepeatCount = 0;
        //动画执行的时间=0.1*总的图片数
        background.animationDuration = 0.1*6;
        //开始动画
        [background startAnimating];
        [self.window addSubview:background];
        

    
    }

    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
