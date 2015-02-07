//
//  FinancesViewController.m
//  Finesse
//
//  Created by William Richman on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import "FinancesViewController.h"

@interface FinancesViewController ()

@property (weak, nonatomic) IBOutlet UITextField *grossIncomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *transportCostTextField;
@property (weak, nonatomic) IBOutlet UISlider *housingCostSlider;
@property (weak, nonatomic) IBOutlet UILabel *housingCostLabel;

@end

@implementation FinancesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)housingCostSliderChanged:(id)sender {
    // Round to nearest dollar and update label
    CGFloat value = [self.housingCostSlider value];
    NSInteger roundValue = (NSInteger)roundf(value);
    self.housingCostLabel.text = [[NSString alloc] initWithFormat:@"$%ld", (long)roundValue];
}

- (IBAction)housingCostSliderFinishedEditing:(id)sender {
    // Round to nearest dollar when slider released, and snap it to that value
    CGFloat value = [self.housingCostSlider value];
    NSInteger roundValue = (NSInteger)roundf(value);
    if (value != roundValue) {
        [self.housingCostSlider setValue:roundValue animated:true];
    }
}

@end
