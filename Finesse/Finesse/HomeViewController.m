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
@property (weak, nonatomic) IBOutlet UITextField *enterAddressTextField;
@property (weak, nonatomic) IBOutlet UIView *resultsView;
@property (weak, nonatomic) IBOutlet UILabel *resultsText;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.enterAddressTextField.delegate = self;
    self.resultsView.layer.cornerRadius = 10.0f;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}


#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didFinishEditingFinanceInfo:(NSDictionary *)financeInfo {
    
}

@end
