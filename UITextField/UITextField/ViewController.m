//
//  ViewController.m
//  UITextField
//
//  Created by Apple on 16/1/28.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *ClickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [ClickBtn setTitle:@"登录" forState:UIControlStateNormal];
    [ClickBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    ClickBtn.frame = CGRectMake(100,100, 50,30);
    [ClickBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ClickBtn];
    
   
    
}

- (void)click
{
    LoginViewController *login = [[LoginViewController alloc] init];
    [self presentViewController:login animated:YES completion:nil];
}


@end
