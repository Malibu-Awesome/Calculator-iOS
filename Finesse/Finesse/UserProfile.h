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

+(UserProfile *)createUserProfileWithAddress:(Address *)address
                                 grossIncome:(NSUInteger *)gross
                             availableIncome:(NSNumber *)available
                         transportationCosts:(NSUInteger *)transportation;

@end
