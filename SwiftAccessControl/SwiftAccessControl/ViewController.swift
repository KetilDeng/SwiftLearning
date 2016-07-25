//
//  ViewController.swift
//  SwiftAccessControl
//
//  Created by Kerry on 16/6/8.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let aPublicObjc = PublicClass()
        
        let a = aPublicObjc.a
        let b = aPublicObjc.b
        //let c = aPublicObjc.c
        print("a = \(a)\n b = \(b)")
        
        aPublicObjc.aInternalFunction()
        aPublicObjc.aPublicFunction()
        //aPublicObjc.aPrivateFunction()
        
        let aInternalObjc = InternalClass()
        let bb = aInternalObjc.b
        //let c = aInternalObjc.c
        print("\(bb)")
        aInternalObjc.aInternalFunction()
        //aInternalObjc.aPrivateFunction()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

