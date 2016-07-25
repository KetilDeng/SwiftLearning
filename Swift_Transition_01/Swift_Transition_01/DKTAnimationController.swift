//
//  DKTAnimationController.swift
//  Swift_Transition_01
//
//  Created by Kerry on 16/5/21.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

enum DKTTransitionType {
    case NavigationTransition(UINavigationControllerOperation)
    case TabTransition(TabOperationDirection)
    case ModalTransition(ModalOperation)
    
}

enum TabOperationDirection {
    case Left, Right
}

enum ModalOperation {
    case Presentation, Dismissal
}

class DKTAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    private var transitionType: DKTTransitionType

    init(type : DKTTransitionType) {
        
        transitionType = type
        super.init()
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        return 0.1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        guard let containerView = transitionContext.containerView(), fromVC  = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey), toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
            else {return}
        
        let fromView = fromVC.view
        let toView = toVC.view
        
        var transition = containerView.frame.width
        var fromViewTransform = CGAffineTransformIdentity
        var toViewTransform = CGAffineTransformIdentity
        
        switch transitionType {
        case .NavigationTransition(let operantion):
            transition = operantion == .Push ? transition : -transition
            toViewTransform = CGAffineTransformMakeTranslation(transition, 0)
            fromViewTransform = CGAffineTransformMakeTranslation(-transition, 0)
            
        case .TabTransition(let direction):
            transition = direction == .Left ? transition : -transition
            fromViewTransform = CGAffineTransformMakeTranslation(transition, 0)
            toViewTransform = CGAffineTransformMakeTranslation(-transition, 0)
            
        case .ModalTransition(let operation):
            transition = containerView.frame.height
            toViewTransform = CGAffineTransformMakeTranslation(0, (operation == .Presentation ? transition : 0))
            fromViewTransform = CGAffineTransformMakeTranslation(0, (operation == .Presentation ? 0 : transition))
        }
        
        switch  transitionType{
        case .ModalTransition(let operation):
            switch operation {
            case .Presentation:
                containerView.addSubview(toView)
            case .Dismissal:
                break
            }
        default:
            containerView.addSubview(toView)
        }
        
        toView.transform = toViewTransform
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            
            fromView.transform = fromViewTransform
            toView.transform = CGAffineTransformIdentity
        
            }) { (finished) in
                /** 考虑到转场中途可能取消的情况，转场结束后，恢复视图状态。 */
                fromView.transform = CGAffineTransformIdentity
                toView.transform = CGAffineTransformIdentity
                
                /** 动画结束后正确地结束转场过程。转场的结果有两种：完成或取消。非交互转场的结果只有完成一种情况，不过交互式转场需要考虑取消的情况。如何结束取决于转场的进度，通过transitionWasCancelled()方法来获取转场的结果，然后使用completeTransition:来通知系统转场过程结束，这个方法会检查动画控制器是否实现了animationEnded:方法，如果有，则调用该方法。 */
                let isCancelled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!isCancelled)
        }
        
    }
    
    
}
