//
//  UIViewController+Associated.h
//  Runtime_ Associated
//
//  Created by Kerry on 16/2/18.
//  Copyright © 2016年 DKT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Associated)

@property (assign, nonatomic) NSString *associatedObject_assign;
@property (strong, nonatomic) NSString *associatedObject_retain;
@property (copy,   nonatomic) NSString *associatedObject_copy;
@property (nonatomic, assign) BOOL associatedObject_bool;
@property (nonatomic, assign) NSInteger associatedObject_integer;

@end
