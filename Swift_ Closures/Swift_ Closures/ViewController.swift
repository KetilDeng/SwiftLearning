//
//  ViewController.swift
//  Swift_ Closures
//
//  Created by Kerry on 16/3/4.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arr = [1, 2, 3, 4]
        let arr1 = Getlist(arr) { (s:Int) -> Bool in
            s > 2
        }
        print(arr1)
        
        /// 省略参数类型和括号
        let arr2 = Getlist(arr, pre: {s in return s > 2})
        print(arr2)
        
        /// 省略参数类型、括号、return关键字
        let arr3 = Getlist(arr, pre: {s in s > 2})
        print(arr3)
        
        /// 参数名缩写
        let arr4 = Getlist(arr, pre: {$0>2})
        print(arr4)
        
        Fuction(1) { () -> () in
            print("hello")
        }
    }
    
    func Getlist(arr:[Int], pre:(Int) -> Bool) -> [Int]{
        
        var tempArr = [Int]()
        for temp in arr{
            if pre(temp){
                tempArr.append(temp)
            }
        }
        return tempArr
    }
    
    func Fuction(s:Int, closure:()->()){
        print(s)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
