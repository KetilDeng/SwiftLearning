//
//  ViewController.m
//  Runtime_ Associated
//
//  Created by Kerry on 16/1/20.
//  Copyright © 2016年 DKT. All rights reserved.
//

#import "ViewController.h"

#import "UIViewController+Associated.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.associatedObject_assign = [NSString stringWithFormat:@"dengketao1"];
    self.associatedObject_retain = [NSString stringWithFormat:@"dengketao2"];
    self.associatedObject_copy   = [NSString stringWithFormat:@"dengketao3"];
    self.associatedObject_bool = YES;
    self.associatedObject_integer = 7;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"self.associatedObject_assign: %@", self.associatedObject_assign);
    NSLog(@"self.associatedObject_retain: %@", self.associatedObject_retain);
    NSLog(@"self.associatedObject_copy:%@", self.associatedObject_copy);
    NSLog(@"associatedObject_bool:%d", self.associatedObject_bool);
    NSLog(@"associatedObject_integer:%ld",self.associatedObject_integer);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
