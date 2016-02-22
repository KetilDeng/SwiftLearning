//
//  ViewController.m
//  FMDB_Manager
//
//  Created by Kerry on 16/2/20.
//  Copyright © 2016年 DKT. All rights reserved.
//

#import "ViewController.h"

#import "Dog.h"
#import "FMDBManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 10; i ++)
    {
        Dog *dog = [Dog new];
        dog.name = [NSString stringWithFormat:@"dog%d",i];
        dog.age = i;
        [[FMDBManager sharedInstance] insertAndUpdateModelToDatabase:dog andWithSuffix:nil];
    }
    for (int i = 0; i < 10; i ++)
    {
        Dog *dog = [Dog new];
        dog.name = [NSString stringWithFormat:@"dog%d",i];
        dog.age = i;
        [[FMDBManager sharedInstance] insertAndUpdateModelToDatabase:dog andWithSuffix:@"_two"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
