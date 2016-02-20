//
//  UIAlertController+Blocks.m
//  AlertController_Blocks
//
//  Created by Kerry on 16/2/18.
//  Copyright © 2016年 DKT. All rights reserved.
//

#import "UIAlertController+Blocks.h"

@implementation UIAlertController (Blocks)

+ (instancetype)createAlertControllerWithmessage:(NSString *)message{
    return [self createAlertControllerWithTitle:nil
                                        message:message
                              cancleActionTitle:@"确定"
                         destructiveActionTitle:nil
                                        actions:nil
                                        handler:nil];
}

+ (instancetype)createAlertControllerWithTitle:(NSString *)title
                                       message:(NSString *)message
                             cancleActionTitle:(NSString *)cancleActionTitle
                        destructiveActionTitle:(NSString *)destructiveActionTitle
                                       actions:(NSArray *)actions
                                       handler:(UIAlertControllerActionBlock)handler{
    return [self createAlertControllerWithTitle:title
                                        message:message
                              cancleActionTitle:cancleActionTitle
                         destructiveActionTitle:destructiveActionTitle
                                          style:UIAlertControllerStyleAlert
                                    withActions:actions
                                    withhandler:handler];
}

+ (instancetype)createAlertControllerWithTitle:(NSString *)title
                                       message:(NSString *)message
                             cancleActionTitle:(NSString *)cancleActionTitle
                        destructiveActionTitle:(NSString *)destructiveActionTitle
                                    textFields:(NSArray *)textFields
                                       actions:(NSArray *)actions
                                       handler:(UIAlertControllerActionBlock)handler{
    
    UIAlertController *alertController = [self createAlertControllerWithTitle:title
                                                                      message:message
                                                            cancleActionTitle:cancleActionTitle
                                                       destructiveActionTitle:destructiveActionTitle
                                                                        style:UIAlertControllerStyleAlert
                                                                  withActions:actions
                                                                  withhandler:handler];
    if (textFields.count) {
        for (NSString *text in textFields) {
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
                textField.placeholder = text;
            }];
        }
    }
    return alertController;
}

+ (instancetype)createAlertControllerWithTitle:(NSString *)title
                                       message:(NSString *)message
                             cancleActionTitle:(NSString *)cancleActionTitle
                        destructiveActionTitle:(NSString *)destructiveActionTitle
                                         style:(UIAlertControllerStyle)style
                                   withActions:(NSArray *)actions
                                   withhandler:(UIAlertControllerActionBlock)handler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancleActionTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (handler) {
            handler(action);
        }
    }];
    [alertController addAction:cancelAction];
    
    if (destructiveActionTitle) {
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveActionTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                handler(action);
            }
        }];
        [alertController addAction:destructiveAction];
    }
    
    if (actions.count > 0) {
        for (NSString *actionTitle in actions) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               if (handler) {
                                                                   handler(action);
                                                               }
                                                           }];
            [alertController addAction:action];
        }
    }
    
#if !__has_feature(objc_arc)
    return [alertController autorelease];
#else
    return alertController;
#endif
}

@end
