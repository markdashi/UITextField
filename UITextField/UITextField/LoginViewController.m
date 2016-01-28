//
//  LoginViewController.m
//  UITextField
//
//  Created by Apple on 16/1/28.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)back
{
    [self dismissViewControllerAnimated:YES completion:nil];

}


@end
