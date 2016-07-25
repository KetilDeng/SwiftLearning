//
//  ViewController.swift
//  Swift_Transition_01
//
//  Created by Kerry on 16/5/21.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var strongDelegate = DKTNavigationDelegation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func pushAction(sender: AnyObject) {
        
        self.navigationController?.delegate = strongDelegate

        let nextVC = NextViewController()
        nextVC.view.backgroundColor = UIColor.redColor()
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

