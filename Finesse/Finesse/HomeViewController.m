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
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (strong, nonatomic) UserProfile *userProfile;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.streetAddressTextField.delegate = self;
    self.cityTextField.delegate = self;
    self.stateTextField.delegate = self;
    self.zipTextField.delegate = self;
    self.resultsView.layer.cornerRadius = 10.0f;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                action:@selector(dismissEditing)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
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

#pragma mark - FinancesViewControllerDelegate methods

- (void)didFinishEditingFinanceInfo:(UserProfile *)userProfile {
    _userProfile = userProfile;
}

#pragma mark - UIGestureRecognizer selectors

- (void)dismissEditing {
    [self.view endEditing:YES];
}

- (IBAction)calculateAffordability:(id)sender {
    if ([self.streetAddressTextField.text isEqualToString:@""] ||
        [self.cityTextField.text isEqualToString:@""] ||
        [self.stateTextField.text isEqualToString:@""] ||
        [self.zipTextField.text isEqualToString:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Error!"
                                                                       message:@"You need to enter all information!"
                                                                preferredStyle: UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault
                                                handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    } else if (self.userProfile == nil) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Error!"
                                                                       message: @"You need to enter your finances!"
                                                                preferredStyle: UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                  style:UIAlertActionStyleCancel
                                                handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"Go to Finances"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *action) {
                                                    [self performSegueWithIdentifier:@"PRESENT_FINANCEVC"
                                                                              sender:self];
                                                }]];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        self.calculateButton.hidden = YES;
        [self.activityIndicator startAnimating];
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        //Input is an dictionary with the keys: street, city, state, zip
        //Zip is an NSNumber
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *zip = [formatter numberFromString:self.zipTextField.text];
        NSDictionary *addressDict = @{@"street": self.streetAddressTextField.text,
                                      @"city": self.cityTextField.text,
                                      @"state": self.stateTextField.text,
                                      @"zip": zip};
        [self.userProfile createAddressWithDictionary:addressDict];
        NSDictionary *params = [self.userProfile makeDictionary];
        [appDelegate.networkController createGetRequestWithParams:params completionHandler:^(NSError *error, NSString *response) {
                if (error == nil) {
                    [self.activityIndicator stopAnimating];
                    if ([response isEqualToString: @"green"]) {
                        self.resultsView.backgroundColor = [UIColor greenColor];
                        self.resultsText.textColor = [UIColor whiteColor];
                        self.resultsText.text = @"Yes!";
                        self.resultsView.hidden = NO;
                        self.resetButton.hidden = NO;
                    } else if ([response isEqualToString: @"yellow"]) {
                        self.resultsView.backgroundColor = [UIColor yellowColor];
                        self.resultsText.text = @"Maybe";
                        self.resultsView.hidden = NO;
                        self.resetButton.hidden = NO;
                    } else if ([response isEqualToString:@"red"]) {
                        self.resultsView.backgroundColor = [UIColor redColor];
                        self.resultsText.textColor = [UIColor whiteColor];
                        self.resultsText.text = @"No";
                        self.resultsView.hidden = NO;
                        self.resetButton.hidden = NO;
                    } else {
                        [self.activityIndicator stopAnimating];
                        self.calculateButton.hidden = NO;
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Error!"
                                                                                       message:@"There was a network error, please try again."
                                                                                preferredStyle: UIAlertControllerStyleAlert];
                        [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:nil]];
                        [self presentViewController:alert animated:YES completion:nil];
                    }

                } else {
                    [self.activityIndicator stopAnimating];
                    self.calculateButton.hidden = NO;
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Error!"
                                                                                   message:@"There was a network error, please try again."
                                                                            preferredStyle: UIAlertControllerStyleAlert];
                    [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                              style:UIAlertActionStyleDefault
                                                            handler:nil]];
                    [self presentViewController:alert animated:YES completion:nil];
                }
        }];
    }
}

- (IBAction)resetPressed:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Reset"
                                                                        message: @"Are you sure?"
                                                                 preferredStyle: UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                              style:UIAlertActionStyleCancel
                                            handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Reset all"
                                              style:UIAlertActionStyleDestructive
                                            handler:^(UIAlertAction *action) {
                                                [self resetAll];
                                            }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)resetAll {
    self.resetButton.hidden = YES;
    self.resultsView.hidden = YES;
    self.calculateButton.hidden = NO;
    self.streetAddressTextField.text = @"";
    self.cityTextField.text = @"";
    self.stateTextField.text = @"";
    self.zipTextField.text = @"";
    self.userProfile = nil;
}

@end
