//
//  HomeViewController.m
//  sLMS
//
//  Created by Mayank on 08/07/15.
//  Copyright (c) 2015 Mayank. All rights reserved.
//

#import "HomeViewController.h"
#import "RegisterationViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize _homeViewController,_navigationController_Login;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
#pragma mark - ButtonClicks
- (IBAction)btnFacebookClick:(id)sender {
}

- (IBAction)btnLoginClick:(id)sender {
    LoginViewController *loginViewController= [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:loginViewController animated:YES];
}

- (IBAction)btnRegisterClick:(id)sender {
    RegisterationViewController *viewController= [[RegisterationViewController alloc]initWithNibName:@"RegisterationViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];

}
@end
