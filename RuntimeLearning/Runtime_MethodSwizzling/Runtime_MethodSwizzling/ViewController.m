//
//  ViewController.m
//  Runtime_MethodSwizzling
//
//  Created by Kerry on 16/2/25.
//  Copyright © 2016年 DKT. All rights reserved.
//

#import "ViewController.h"

#import "UIViewController+MethodSwizzling.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
