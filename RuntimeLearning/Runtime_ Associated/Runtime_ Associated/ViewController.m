//
//  ViewController.m
//  Runtime_ Associated
//
//  Created by Kerry on 16/1/20.
//  Copyright © 2016年 DKT. All rights reserved.
//

#import "ViewController.h"

#import "UIViewController+Associated.h"

__weak NSString *string_weak_assign = nil;
__weak NSString *string_weak_retain = nil;
__weak NSString *string_weak_copy   = nil;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.associatedObject_assign = [NSString stringWithFormat:@"dengketao1"];
    self.associatedObject_retain = [NSString stringWithFormat:@"dengketao2"];
    self.associatedObject_copy   = [NSString stringWithFormat:@"dengketao3"];
//    self.associatedObject_bool = NO;

    string_weak_assign = self.associatedObject_assign;
    string_weak_retain = self.associatedObject_retain;
    string_weak_copy   = self.associatedObject_copy;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"self.associatedObject_assign: %@", self.associatedObject_assign); 
    NSLog(@"self.associatedObject_retain: %@", self.associatedObject_retain);
    NSLog(@"self.associatedObject_copy:%@", self.associatedObject_copy);
//    NSLog(@"associatedObject_bool:%d", self.associatedObject_bool);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
