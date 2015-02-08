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
    if (![self.grossIncomeTextField.text isEqualToString: @""] &&
        ![self.transportCostTextField.text isEqualToString:@""]) {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        }];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Error!"
                                                                       message:@"You need to enter all information!"
                                                                preferredStyle: UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault
                                                handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)cancelEditingIncome:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - UISlider Methods

- (IBAction)housingCostSliderChanged:(id)sender {
    // Round to nearest value divisible by 50 and update label
    CGFloat value = [self.housingCostSlider value];
    int roundValue = ((int)((value + 25) / 50) * 50);
    self.housingCostLabel.text = [[NSString alloc] initWithFormat:@"$%ld", (long)roundValue];
}

- (IBAction)housingCostSliderFinishedEditing:(id)sender {
    // Round to nearest value divisible by 50 when slider released, and snap it to that value
    CGFloat value = [self.housingCostSlider value];
    int roundValue = ((int)((value + 25) / 50) * 50);
    if (value != roundValue) {
        [self.housingCostSlider setValue:roundValue animated:true];
    }
}

#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == self.grossIncomeTextField && self.grossIncomeTextField.text != nil) {
        int income = [self.grossIncomeTextField.text intValue];
        // Set the default housing budget to 36% of gross income & round to nearest number divisible by 50
        int defaultHousingCost = (int)(((income / 12 * 0.36) + 25) / 50) * 50;
        // Set the maximum housing budget to double the default cost
        int maxHousingCost = defaultHousingCost * 2;
        // Set slider and label accordingly
        self.housingCostSlider.maximumValue = maxHousingCost;
        self.housingCostSlider.value = defaultHousingCost;
        self.housingCostLabel.text = [[NSString alloc] initWithFormat:@"$%ld", (long)defaultHousingCost];
    }
    return YES;
}

@end
