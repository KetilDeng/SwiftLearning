//
//  ViewController.swift
//  Swift_1.6
//
//  Created by Kerry on 16/2/19.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //可选类型
        var str1 : String?
        print(str1)
        //        print(str1!)
        if(str1 != nil){
            print("有值")
        }else{
            print("nil");
        }
        str1 = "abc"
        
        //运算符、表达式
        var a = 0
        ++a
        print(a)

        let b = ++a
        let c = a++
        
        print(b)
        print(c)
        
        for index in 1...5
        {
            print(index)
        }
        for index in 1..<5
        {
            print(index)
        }
        
        var book:Bool = true
        var iphone:Bool = false
        var mac:Bool = false
        
        if(book && iphone && mac)
        {
            print("与进来")
        }
        if(iphone || mac || book)
        {
            print("或进来")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

