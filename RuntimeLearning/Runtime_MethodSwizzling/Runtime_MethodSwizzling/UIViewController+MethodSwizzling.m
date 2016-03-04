//
//  UIViewController+MethodSwizzling.m
//  Runtime_MethodSwizzling
//
//  Created by Kerry on 16/2/25.
//  Copyright © 2016年 DKT. All rights reserved.
//

#import "UIViewController+MethodSwizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (MethodSwizzling)

+ (void)load
{
    static dispatch_once_t oneceToken;
    dispatch_once(&oneceToken, ^{
        Class aClass = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzlingSelector = @selector(dkt_viewWillAppear:);
        Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
        Method swizzlingMethod = class_getInstanceMethod(aClass, swizzlingSelector);
        BOOL didAddMethod = class_addMethod(aClass,
                                            originalSelector,
                                            method_getImplementation(swizzlingMethod),
                                            method_getTypeEncoding(swizzlingMethod));
        if (didAddMethod) {
            class_replaceMethod(aClass,
                                swizzlingSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        }else{
            method_exchangeImplementations(originalMethod, swizzlingMethod);
        }
    });
}

- (void)dkt_viewWillAppear:(BOOL)animated{
    [self dkt_viewWillAppear:animated];
    NSLog(@"我是 dkt_viewWillAppear");
}

@end
