//
//  DKTNavigationDelegation.swift
//  Swift_Transition_01
//
//  Created by Kerry on 16/5/21.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class DKTNavigationDelegation: NSObject, UINavigationControllerDelegate {
    
    var interactive = false
    var interactionController = UIPercentDrivenInteractiveTransition()
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return interactive ? self.interactionController : nil
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let transitionType = DKTTransitionType.NavigationTransition(operation)
        return DKTAnimationController(type: transitionType)
    }

}
