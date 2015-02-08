//
//  FinancesViewController.m
//  Finesse
//
//  Created by William Richman on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import "FinancesViewController.h"

@interface FinancesViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *grossIncomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *transportCostTextField;
@property (weak, nonatomic) IBOutlet UISlider *housingCostSlider;
@property (weak, nonatomic) IBOutlet UILabel *housingCostLabel;
@property (weak, nonatomic) id <FinancesViewControllerDelegate> delegate;

@end

@implementation FinancesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.grossIncomeTextField.delegate = self;
    self.transportCostTextField.delegate = self;
}

#pragma mark - Navigation

- (IBAction)doneEditingIncome:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)cancelEditingIncome:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - UISlider Methods

- (IBAction)housingCostSliderChanged:(id)sender {
    // Round to nearest dollar and update label
    CGFloat value = [self.housingCostSlider value];
    NSInteger roundValue = ((NSInteger)((value + 2.5) / 5) * 5);
    self.housingCostLabel.text = [[NSString alloc] initWithFormat:@"$%ld", (long)roundValue];
}

- (IBAction)housingCostSliderFinishedEditing:(id)sender {
    // Round to nearest dollar when slider released, and snap it to that value
    CGFloat value = [self.housingCostSlider value];
    NSInteger roundValue = ((NSInteger)((value + 2.5) / 5) * 5);
    if (value != roundValue) {
        [self.housingCostSlider setValue:roundValue animated:true];
    }
}

#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
