//
//  AppDelegate.m
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSOperationQueue *dataQueue;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _dataController = [DataController sharedInstance];
    _networkController = [NetworkController sharedInstance];
    
    _dataQueue = [[NSOperationQueue alloc] init];
    _dataQueue.qualityOfService = NSOperationQueuePriorityHigh;
    _dataQueue.maxConcurrentOperationCount = 1;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"" object:self queue:_dataQueue usingBlock:^(NSNotification *note) {
        //
    }];
    //[[NSNotificationCenter defaultCenter] postNotificationName:<#(NSString *)#> object:<#(id)#> userInfo:<#(NSDictionary *)#>];
    
    //This was just to test.
//    [_networkController testGETRequest];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:@"" object:nil];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"" object:self queue:_dataQueue usingBlock:^(NSNotification *note) {
        //
    }];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
