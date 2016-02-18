//
//  ViewController.m
//  AlertController_Blocks
//
//  Created by Kerry on 16/2/18.
//  Copyright © 2016年 DKT. All rights reserved.
//

#import "ViewController.h"

#import "UIAlertController+Blocks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.center.x - 150, 50, 300, 50)];
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"UIAlertControllerStyleAlert" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.tag = 1;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(button.frame.origin.x, CGRectGetMaxY(button.frame) + 10, 300, 50)];
    button2.backgroundColor = [UIColor grayColor];
    [button2 setTitle:@"UIAlertControllerStyleActionSheet" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    button2.tag = 2;
    [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)button
{
    //    [self presentViewController:[UIAlertController createAlertControllerWithmessage:@"请先登录"] animated:YES completion:nil];
    
    if (button.tag == 1) {
        [self presentViewController:[UIAlertController createAlertControllerWithTitle:@"提示"
                                                                              message:@"未登录"
                                                                    cancleActionTitle:@"取消"
                                                               destructiveActionTitle:@"摧毁"
                                                                              actions:@[@"去登录"]
                                                                              handler:^(UIAlertAction * _Nullable acion) {
                                                                                  NSLog(@"%@",acion.title);
                                                                                  if ([acion.title isEqualToString:@"去登录"]) {
                                                                                      [self presentViewController:[UIAlertController createAlertControllerWithTitle:@"提示"
                                                                                                                                                            message:@"未登录"
                                                                                                                                                  cancleActionTitle:@"取消"
                                                                                                                                             destructiveActionTitle:nil
                                                                                                                                                         textFields:@[@"用户",@"密码"]
                                                                                                                                                            actions:@[@"确定"]
                                                                                                                                                            handler:^(UIAlertAction * _Nullable acion) {
                                                                                                                                                                NSLog(@"%@",acion.title);
                                                                                                                                                            }]
                                                                                                         animated:YES completion:nil];                                                                              }
                                                                              }]
                           animated:YES completion:nil];
        
    }
    else
    {
        [self presentViewController:[UIAlertController createAlertControllerWithTitle:@"提示"
                                                                              message:@"数据删除将无法恢复"
                                                                    cancleActionTitle:@"取消"
                                                               destructiveActionTitle:@"删除"
                                                                                style:UIAlertControllerStyleActionSheet
                                                                          withActions:@[@"保存"]
                                                                          withhandler:^(UIAlertAction * _Nullable acion) {
                                                                              NSLog(@"%@",acion.title);
                                                                          }]
                           animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
