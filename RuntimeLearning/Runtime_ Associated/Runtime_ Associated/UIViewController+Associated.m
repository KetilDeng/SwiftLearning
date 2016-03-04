//
//  UIViewController+Associated.m
//  Runtime_ Associated
//
//  Created by Kerry on 16/2/18.
//  Copyright © 2016年 DKT. All rights reserved.
//

#import "UIViewController+Associated.h"

#import <objc/runtime.h>

@implementation UIViewController (Associated)

- (void)setAssociatedObject_assign:(NSString *)associatedObject_assign{
    objc_setAssociatedObject(self, @selector(associatedObject_assign), associatedObject_assign, OBJC_ASSOCIATION_ASSIGN);
}

- (void)setAssociatedObject_retain:(NSString *)associatedObject_retain{
    objc_setAssociatedObject(self, @selector(associatedObject_retain), associatedObject_retain, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setAssociatedObject_copy:(NSString *)associatedObject_copy{
    objc_setAssociatedObject(self, @selector(associatedObject_copy), associatedObject_copy, OBJC_ASSOCIATION_COPY);
}

- (void)setAssociatedObject_bool:(BOOL)associatedObject_bool{
    objc_setAssociatedObject(self, @selector(associatedObject_bool), @(associatedObject_bool), OBJC_ASSOCIATION_ASSIGN);
}

- (void)setAssociatedObject_integer:(NSInteger)associatedObject_integer{
    objc_setAssociatedObject(self, @selector(associatedObject_integer), @(associatedObject_integer), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)associatedObject_integer{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (BOOL)associatedObject_bool{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (NSString *)associatedObject_assign{
    return objc_getAssociatedObject(self, _cmd);
}

- (NSString *)associatedObject_retain{
    return objc_getAssociatedObject(self, _cmd);
}

- (NSString *)associatedObject_copy{
    return objc_getAssociatedObject(self, _cmd);
}

@end
