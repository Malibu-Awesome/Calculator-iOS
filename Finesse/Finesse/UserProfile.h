//
//  UserProfile.h
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Address;

@interface UserProfile : NSObject

@property (readonly, nonatomic, strong) Address *address;
@property (readonly, nonatomic, strong) NSNumber *grossIncome;
@property (readonly, nonatomic, strong) NSNumber *percentAvailableIncome;
@property (readonly, nonatomic, strong) NSNumber *transportationCosts;

+(UserProfile *)createUserProfileWithAddress:(Address *)address
                                 grossIncome:(NSNumber *)gross
                             availableIncome:(NSNumber *)available
                         transportationCosts:(NSNumber *)transportation;
-(NSDictionary *)makeDictionary;

@end
