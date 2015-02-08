//
//  UserProfile.m
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import "UserProfile.h"
#import "Address.h"

@interface UserProfile ()

@property (readwrite, nonatomic, strong) Address *address;
@property (readwrite, nonatomic, strong) NSNumber *grossIncome;
@property (readwrite, nonatomic, strong) NSNumber *percentAvailableIncome;
@property (readwrite, nonatomic, strong) NSNumber *transportationCosts;

@end

@implementation UserProfile

- (instancetype)init
{
    self = [super init];
    if (self) {
        //
    }
    return self;
}

+(UserProfile *)createUserProfileWithAddress:(Address *)address grossIncome:(NSNumber *)gross availableIncome:(NSNumber *)available transportationCosts:(NSNumber *)transportation
{
    UserProfile *profile = [[UserProfile alloc] init];
    profile.address = address;
    profile.grossIncome = gross;
    profile.percentAvailableIncome = available;
    profile.transportationCosts = transportation;
    
    return profile;
}

//Input is an dictionary with the keys: street, city, state, zip
//Zip is an NSNumber
-(void)createAddressWithDictionary:(NSDictionary *)input
{
    _address = [[Address alloc] init];
    
    for (NSString *type in input.allKeys) {
        if ([type  isEqualToString: @"street"]) {
            _address.street = input[type];
        } else if ([type isEqualToString:@"city"]) {
            _address.city = input[type];
        } else if ([type isEqualToString:@"state"]) {
            _address.state = input[type];
        } else if ([type isEqualToString:@"zip"]) {
            _address.zip = input[type];
        }
    }
}

-(void)updateAddress:(NSDictionary *)input
{
    for (NSString *type in input.allKeys) {
        if ([type  isEqualToString: @"street"]) {
            _address.street = input[type];
        } else if ([type isEqualToString:@"city"]) {
            _address.city = input[type];
        } else if ([type isEqualToString:@"state"]) {
            _address.state = input[type];
        } else if ([type isEqualToString:@"zip"]) {
            _address.zip = input[type];
        }
    }
}

-(void)updateGrossIncome:(NSNumber *)income
{
    _grossIncome = income;
}

-(void)updatePercentAvailableIncome:(NSNumber *)percent
{
    _percentAvailableIncome = percent;
}

-(void)updateTransportationCosts:(NSNumber *)transportation
{
    _transportationCosts = transportation;
}


@end