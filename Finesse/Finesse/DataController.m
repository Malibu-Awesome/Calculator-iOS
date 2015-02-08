//
//  DataController.m
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import "DataController.h"
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

#pragma mark - Protocols
#pragma mark SocketDataIO
-(void)dataIn
{
    
}

-(void)dataOut:(NSDictionary *)_
{
    
}

@end
