//
//  DataController.m
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import "DataController.h"
#import "UserProfile.h"
#import "Finesse-Swift.h"
@class SocketController;

@interface DataController () <SocketDataIO>

@property (nonatomic, strong) SocketController *socketController;

@end

@implementation DataController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.socketController = [SocketController sharedInstance];
    }
    return self;
}

+(DataController *)sharedInstance
{
    static DataController *sharedInstance = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[DataController alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - Protocols
#pragma mark SocketDataIO
-(void)dataIn
{
    NSError *error;
    NSData *json = [NSJSONSerialization dataWithJSONObject:[_userProfile makeDictionary] options:NSJSONWritingPrettyPrinted error:&error];
    //options should be set to 0 after they can fully process the JSON.
    
    if (error) {
        NSLog(@"Error from Inputting Json:\n%@", error.localizedDescription);
    } else {
        [_socketController sendJSON:json];
    }
}

-(void)dataOut:(NSDictionary *)_
{
    
}

@end
