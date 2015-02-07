//
//  Address.h
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject

@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSNumber *zip;

+ (Address *)createAddressWithStreet:(NSString *)street
                                city:(NSString *)city
                               state:(NSString *)state
                                 zip:(NSNumber *)zip;

@end
