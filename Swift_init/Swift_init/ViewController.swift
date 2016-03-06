//
//  ViewController.swift
//  Swift_init
//
//  Created by Kerry on 16/3/6.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s = School()
        let s1 = School1(name: "hello")
        print(s.name)
        print(s1.name)
        let d = Distance.init(fromCm: 8.0)
        let d1 = Distance.init(fromKm: 6.0)
        print(d.meters)
        print(d1.meters)
        
    }
    

    
    struct School {
        var name:String
        init(){
            name = "hello"
        }
    }
    
    struct School1 {
        var name = "hello"
    }
    
    struct Distance {
        var meters:Double
        init(fromKm km:Double){
            meters = km * 1000.0
        }
        init(fromCm cm:Double){
            meters = cm / 100.0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class ViewController1: ViewController,Protocol1,Protocol2 {
    func getName() {
        print("hello")
    }
    func logName() {
        print("world")
    }
}

protocol Protocol1{
    func getName()
}

protocol Protocol2{
     func logName()
}
