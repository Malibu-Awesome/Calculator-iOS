//
//  HomeViewController.m
//  Finesse
//
//  Created by William Richman on 2/7/15.
//  Copyright (c) 2015 Code Fellows Malibu Awesome. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *enterIncomeButton;
@property (weak, nonatomic) IBOutlet UITextField *enterAddressTextField;
@property (weak, nonatomic) IBOutlet UIView *resultsView;
@property (weak, nonatomic) IBOutlet UILabel *resultsText;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation HomeViewController

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

@end
