//
//  AppDelegate.h
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "DataController.h"
#import "NetworkController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) DataController *dataController;
@property (nonatomic, strong) NetworkController *networkController;

@end

