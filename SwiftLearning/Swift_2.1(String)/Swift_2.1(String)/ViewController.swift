//
//  ViewController.swift
//  Swift_2.1(String)
//
//  Created by Kerry on 16/2/22.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let str = "hello"
        let str1 = "hello world !"
        let str2 = "\u{24}"
        let str3 = "\u{1F496}"
        print("\(str)\n\(str1)\n\(str2)\n\(str3)")
        
        var str4 = "iphone6"
        let str5:Character = "s"
        str4.append(str5)
        print(str4)
        
        let str6 = "5"
        let str7 = "str6 = \(str6)"
        print(str7)
        
        //比较
        if str6 == str7{
            print("str6 == str7")
        }else{
            print("str6 != str7")
        }
        
        if str.hasPrefix("hello"){
            print("前缀： hello")
        }
        if str1.hasSuffix("!"){
            print("后缀： ！")
        }
        
        //大小写
        let str8 = "Can you help me ?"
        let str9 = str8.uppercaseString
        print(str9)
        let str10 = str9.lowercaseString;
        print(str10)
        
        //空判断
        let str11 = ""
        if str11.isEmpty{
            print("str11 为空")
        }else{
            print("str11 不为空")
        }
        
        if str10.isEmpty{
            print("str10 不为空")
        }else{
            print("str10 不为空")
        }
        
        //字符串截取
        //1
        var str12:String = "the url is iphone.com"
        var fromStr = (str12 as NSString).substringFromIndex(5)
        var toStr = (str12 as NSString).substringToIndex(4)
        var rangeStr = (str12 as NSString).substringWithRange(NSMakeRange(2, 4))
        print("\(str12)\n\(fromStr)\n\(toStr)\n\(rangeStr)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

