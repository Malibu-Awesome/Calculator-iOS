//
//  HomeViewController.m
//  Finesse
//
//  Created by William Richman on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () <UITextFieldDelegate, FinancesViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *enterIncomeButton;
@property (weak, nonatomic) IBOutlet UITextField *streetAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UIView *resultsView;
@property (weak, nonatomic) IBOutlet UILabel *resultsText;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) UserProfile *userProfile;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.streetAddressTextField.delegate = self;
    self.resultsView.layer.cornerRadius = 10.0f;
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: @"PRESENT_FINANCEVC"]) {
        FinancesViewController *financeVC = segue.destinationViewController;
        financeVC.delegate = self;
    }
}

#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didFinishEditingFinanceInfo:(UserProfile *)userProfile {
    self.userProfile = userProfile;
}

@end
