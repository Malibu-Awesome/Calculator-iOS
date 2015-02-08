//
//  NetworkController.h
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>

@interface NetworkController : NSObject

+(NetworkController *)sharedInstance;
-(void)testGETRequest;

@end
