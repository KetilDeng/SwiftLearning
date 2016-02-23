//
//  ViewController.swift
//  Swift_Array_Dictionary
//
//  Created by Kerry on 16/2/23.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //创建、初始化
        var arrary1 = [Int]()
        arrary1 = [1,2,3,4,5]
        print(arrary1)

        var arrary2 = [Double](count: 3, repeatedValue: 8.88)
        var arrary3:[String] = ["Mr. Deng","Mr. Chen"]
        var arrary4 = ["Mr. Deng","Mr. Chen"]
        print(arrary3)
        
        //常见操作
        var arrary4Count = arrary4.count
        if arrary4.isEmpty{
            print("空数组")
        }
        arrary4.append("Mr. Huang")
        arrary4 += ["Mr. Yang","Mr. Jiang"]
        arrary4.insert("Mr. Qi", atIndex: 2)
        arrary4.removeAtIndex(3)
        arrary4[0] = "Mr. Zhang"
        print(arrary4)
        var str1 = arrary4[3]
        print(str1)
        
        for str in arrary4{
            print(str)
        }
        
        //字典
        //创建、初始化
        var dic1:Dictionary<String, String>
        var dic2 = [:]
        var languageDic:Dictionary<String, String> = ["French":"fr","English":"en"]
        var languageDic2 = ["French":"fr","English":"en"]
        
        //常见操作
        let languageDicConunt = languageDic.count
        languageDic["Chinese"] = "ch"
        languageDic.updateValue("fre", forKey: "French")
        languageDic["Chinese"] = nil
        languageDic.removeValueForKey("French")
        for (key, value) in languageDic{
            print("\(key):\(value)")
        }
        for key in languageDic.keys{
            print(key)
        }
        for value in languageDic.values{
            print(value)
        }
        
        //强制解包
        let str:String? = "hello world !"
        print(str!)
        
        //隐式解包
        if let str2 = str {
            let str3 = str2
            print(str3)
        }
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

