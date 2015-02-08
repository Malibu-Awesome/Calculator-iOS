//
//  NetworkController.m
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import "NetworkController.h"
#import "Constants.h"

@interface NetworkController ()

@property (nonatomic, strong) AFHTTPSessionManager *opManager;
@property (nonatomic, strong) AFHTTPRequestOperationManager *reqManager;

@end

@implementation NetworkController

#pragma mark - Init
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _opManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        _reqManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:FIN_ENDPOINT]];
        
        NSOperationQueue *operationQueue = _reqManager.operationQueue;
        [_reqManager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWWAN:
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    [operationQueue setSuspended:NO];
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                case AFNetworkReachabilityStatusUnknown:
                default:
                    NSLog(@"Something weird happened");
                    break;
            }
        }];
        [_reqManager.reachabilityManager startMonitoring];
    }
    return self;
}

+(NetworkController *)sharedInstance
{
    static NetworkController *sharedInstance = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[NetworkController alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - Request
-(void)testGETRequest
{
    NSURL *url = [NSURL URLWithString:FIN_ENDPOINT];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

-(void)createGetRequestWithURL:(NSString *)urlString andParams:(NSDictionary *)params
{
    NSError *error;
    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:params error:&error];
    //Test with Reachability
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reacbility: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
}


@end
