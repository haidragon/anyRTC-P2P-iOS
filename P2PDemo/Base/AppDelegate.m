//
//  AppDelegate.m
//  P2PDemo
//
//  Created by jh on 2017/11/2.
//  Copyright © 2017年 jh. All rights reserved.
//

#import "AppDelegate.h"
#import <RTCP2PEngine/AnyRTCP2PEngine.h>
#import <Bugly/Bugly.h>
#import "AppDelegate+JPush.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
#warning - 前往https://www.anyrtc.io/home创建应用获取相关ID
    //配置信息
    [AnyRTCP2PEngine initEngineWithAnyRTCInfo:developerID andAppId:appID andKey:key andToke:token];
    //配置私有云，默认无需配置
    //[AnyRTCP2PEngine configServerForPriCloud:@"XXX" andPort:nil];
    
    [NSThread sleepForTimeInterval:0.5];
    // 配置IQKeyboardManager
    [self configurationIQKeyboard];
    //极光推送
    [self registerPush:launchOptions];
    
    [Bugly startWithAppId:@"4ebcef40f6"];
    return YES;
}

- (void)configurationIQKeyboard
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window  NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED {
    return UIInterfaceOrientationMaskPortrait;
}

@end
