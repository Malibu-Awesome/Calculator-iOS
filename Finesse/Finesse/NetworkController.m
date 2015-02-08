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
        _reqManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:ENDPOINT]];
        
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
    NSURL *url = [NSURL URLWithString:@"https://guarded-everglades-4877.herokuapp.com/api/v0/geo-route/4600+Silver+Hill+Rd/Suitland/MD"];
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

-(void)createGetRequestWithParams:(NSDictionary *)params completionHandler: (void (^)(NSError *error, NSString *response)) completionHandler
{
//URL/address/city/state/HousingCost(Available Income)/transportationCosts
//@"http://guarded-everglades-4877.herokuapp.com/api/v0/geo-route/4600+Silver+Hill+Rd/Suitland/MD/18000/5000";
//    NSDictionary *address = @{ @"street":streetAddress, @"city":_address.city, @"state":_address.city };
//    NSDictionary *output = [[NSDictionary alloc] initWithObjects:@[address, _grossIncome, _availableIncome, _transportationCosts]
//                                                         forKeys:@[@"address", @"grossIncome", @"available", @"transportationCosts"]];
    NSDictionary *address = params[@"address"];
    NSString *urlString = [NSString stringWithFormat:@"%@%@/%@/%@/%@/%@", ENDPOINT, address[@"street"], address[@"city"], address[@"state"], params[@"available"], params[@"transportationCosts"]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionHandler(nil, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionHandler(error, nil);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];
}


@end
