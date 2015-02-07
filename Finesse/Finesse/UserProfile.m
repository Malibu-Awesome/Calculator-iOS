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

@property (nonatomic, strong) Address *address;
@property (nonatomic) NSUInteger *grossIncome;
@property (nonatomic, strong) NSNumber *percentAvailableIncome;
@property (nonatomic) NSUInteger *transportationCosts;

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

+(UserProfile *)createUserProfileWithAddress:(Address *)address grossIncome:(NSUInteger *)gross availableIncome:(NSNumber *)available transportationCosts:(NSUInteger *)transportation
{
    UserProfile *profile = [[UserProfile alloc] init];
    profile.address = address;
    profile.grossIncome = gross;
    profile.percentAvailableIncome = available;
    profile.transportationCosts = transportation;
    
    return profile;
}

-(void)newAddress
{
    
}

-(void)updateAddress
{
    
}

-(void)updateGrossIncome
{
    
}

-(void)updatePercentAvailableIncome
{
    
}

-(void)updateTransportationCosts
{
    
}


@end
