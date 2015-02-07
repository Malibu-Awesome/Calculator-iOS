//
//  Address.m
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import "Address.h"

@interface Address ()

@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic) NSUInteger *zip;

@end

@implementation Address

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        //
    }
    return self;
}

+ (Address *)createAddressWithStreet:(NSString *)street city:(NSString *)city state:(NSString *)state zip:(NSUInteger *)zip
{
    Address *address = [[Address alloc] init];
    address.street = street;
    address.city = city;
    address.state = state;
    address.zip = zip;
    
    return address;
}

#pragma mark - Updating
//TODO: UpdateWithInfo
- (void)updateWithInfo
{
    
}

@end
