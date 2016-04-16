//
//  ViewController.swift
//  Swift_ Optional
//
//  Created by Kerry on 16/4/13.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let kerry = Person()
        let roomNum = kerry.residence?.numberOfRooms
        print("kerry'roomNum = \(roomNum)")
        
        kerry.residence = Residence()
        let roomNum1 = kerry.residence?.numberOfRooms
        print("kerry'roomNum = \(roomNum1)")
        
        let roomNum2 = kerry.residence!.numberOfRooms
        print("kerry'roomNum = \(roomNum2)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 8
}
