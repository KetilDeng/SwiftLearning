//
//  ViewController.swift
//  Swift_Animation
//
//  Created by Kerry on 16/4/20.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }

    var newFrame = true
    @IBAction func simpleAnimationFrame(sender: AnyObject) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        if newFrame
        {
            testView.frame = CGRectMake(testView.frame.origin.x, testView.frame.origin.y, testView.frame.size.width*0.5, testView.frame.size.height*0.5)
        }
        else
        {
            testView.frame = CGRectMake(testView.frame.origin.x, testView.frame.origin.y, testView.frame.size.width*2, testView.frame.size.height*2)

        }
        newFrame = !newFrame
        UIView.commitAnimations()
    }
    
    var newCenter = true
    @IBAction func simpleAnimationFadeOut(sender: AnyObject) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        if newCenter
        {
            testView.center = CGPointMake(self.view.center.x, self.view.frame.maxY - testView.frame.size.height)
        }
        else
        {
            testView.center = self.view.center
        }
        newCenter = !newCenter
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
    }
    
    @IBAction func simpleAnimationMove(sender: AnyObject) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        testView.alpha = 1.0
    }

    @IBAction func simpleAnimationFadeIn(sender: AnyObject) {
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2.0)
        testView.alpha = 0.0
        
    }
    
    @IBAction func cakFly(sender: AnyObject) {
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        let p1 = CGPointMake(0.0, 0.0)
        let p2 = CGPointMake(320.0, 0.0)
        let p3 = CGPointMake(0.0, 460.0)
        let p4 = CGPointMake(320.0, 460.0)

        let p5 = CGPointMake(160.0, 200.0)
        
        animation.values = [NSValue(CGPoint:p1), NSValue(CGPoint:p2), NSValue(CGPoint:p3), NSValue(CGPoint:p4), NSValue(CGPoint:p5)]
        animation.delegate = self
        animation.duration = 5.0
        
        testView.layer.addAnimation(animation, forKey: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

