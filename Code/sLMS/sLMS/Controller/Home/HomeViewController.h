//
//  HomeViewController.h
//  sLMS
//
//  Created by Mayank on 08/07/15.
//  Copyright (c) 2015 Mayank. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginViewController;
@interface HomeViewController : UIViewController

    @property(nonatomic,strong) HomeViewController *_homeViewController;                     //For Login
    @property(nonatomic,strong) UINavigationController *_navigationController_Login;

- (IBAction)btnFacebookClick:(id)sender;
- (IBAction)btnLoginClick:(id)sender;
- (IBAction)btnRegisterClick:(id)sender;

@end
