//
//  FinancesViewController.h
//  Finesse
//
//  Created by William Richman on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfile.h"

@protocol FinancesViewControllerDelegate <NSObject>

@required
- (void)didFinishEditingFinanceInfo: (UserProfile*)userprofile;

@end

@interface FinancesViewController : UIViewController

@end
