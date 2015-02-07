//
//  Address.h
//  Finesse
//
//  Created by Leonardo Lee on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject

+ (Address *)createAddressWithStreet:(NSString *)street
                                city:(NSString *)city
                               state:(NSString *)state
                                 zip:(NSUInteger *)zip;

@end
