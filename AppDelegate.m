//
//  AppDelegate.m
//  LoveAtEachDay
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 雪凝. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"
#import "RootViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize menuController = _menuController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //程序是否打开过 如果打开过 就不是 第一次打开了
    
    BOOL isOpen = [[NSUserDefaults standardUserDefaults] boolForKey:kIsOpen];
    
    if (!isOpen) {
        //第一次打开
        self.window.rootViewController = [[RootViewController alloc] init];
    }else {
        
        MyTabBarController *tabBar = [[MyTabBarController alloc] init];
        self.window.rootViewController = tabBar;
    }
    //记录打开过
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kIsOpen];
    
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
