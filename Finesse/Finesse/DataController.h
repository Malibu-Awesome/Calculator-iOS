//
//  DataController.h
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserProfile;

@interface DataController : NSObject

@property (nonatomic, strong) UserProfile *userProfile;

+(DataController *)sharedInstance;

@end
