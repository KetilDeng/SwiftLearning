//
//  NextViewController.swift
//  Swift_Transition_01
//
//  Created by Kerry on 16/5/21.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    var endgPanGestrue = UIScreenEdgePanGestureRecognizer()
    var navigationDelegate:DKTNavigationDelegation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        endgPanGestrue.edges = .Left
        endgPanGestrue.addTarget(self, action: #selector(NextViewController.handleEdgePanGesture(_:)))
        view.addGestureRecognizer(endgPanGestrue)
    }
    
    func handleEdgePanGesture(gesture: UIScreenEdgePanGestureRecognizer){
        let translationX =  gesture.translationInView(view).x
        let translationBase: CGFloat = view.frame.width / 3
        let translationAbs = translationX > 0 ? translationX : -translationX
        let percent = translationAbs > translationBase ? 1.0 : translationAbs / translationBase
        
        switch gesture.state{
            
        case .Began:
            
            navigationDelegate = self.navigationController?.delegate as? DKTNavigationDelegation
            navigationDelegate?.interactive = true
            self.navigationController?.popViewControllerAnimated(true)
            
        case .Changed:
            
            navigationDelegate?.interactionController.updateInteractiveTransition(percent)
            
        case .Cancelled, .Ended:
            
            if percent > 0.5
            {
                navigationDelegate?.interactionController.finishInteractiveTransition()
            }
            else
            {
                navigationDelegate?.interactionController.cancelInteractiveTransition()
            }
            navigationDelegate?.interactive = false
            
        default: break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
