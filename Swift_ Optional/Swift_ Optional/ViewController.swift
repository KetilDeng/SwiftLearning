//
//  ViewController.swift
//  Swift_ Optional
//
//  Created by Kerry on 16/4/13.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: MARK 用于方法或函数的注释。
    
    // TODO: 表示这里代码有没有完成，还要处理。
    
    // FIXME: 表示这里修改了代码。
    
    // MARK:
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //let num:Int = nil //编译错误
        //let str:String = nil //编译错误
        var num:Int? = 10
        num = nil // 可选类型可以赋值nil
        var str:String? = "dengketao"
        str = nil //可选类型可以赋值nil
        
        // “拆包”分为显示拆包和隐性拆包。
        // 使用问号（?）声明的可选类型，在拆包时需要使用感叹号（!），这种拆包方式称为“显式拆包”
        // 使用感叹号（!）声明的可选类型，在拆包时可以不使用感叹号（!），这种表示方式称为“隐式拆包”
        
        
        var num1:Int? = 10
        //print("\(num1 + 100)") //编译错误
        // FIXME:修改代码
        print("显示拆包 \(num1! + 100)") //显示拆包
        var num2:Int! //声明的 num2 也是可选类型
        num2 = 10
        print("隐式拆包 \(num2 + 100)") //隐式拆包
       
        let kerry = Person()
        //let roomNum = kerry.residence!.info!.numberOfRooms //显示拆包，遇到nil，程序crash
        let roomNum = kerry.residence?.info?.numberOfRooms //可选链，可选链中全部为nil 则返回 nil
        print("kerry'roomNum = \(roomNum)")
        
        kerry.residence = Residence()
        //let roomNum1 = kerry.residence!.info!.numberOfRooms //显示拆包，遇到nil，程序crash
        //let roomNum1 = kerry.residence?.info!.numberOfRooms //显示拆包，遇到nil，程序crash
        //let roomNum1 = kerry.residence?.info?.numberOfRooms //可选链中某个为nil，则返回nil
        let roomNum1 = kerry.residence!.info?.numberOfRooms //可选链中某个为nil，则返回nil
        print("kerry'roomNum = \(roomNum1)")

        kerry.residence?.info = Info()
        let roomNum2 = kerry.residence!.info!.numberOfRooms //显示拆包
        let roomNum3:Int64? =  kerry.residence!.info!.numberOfRooms //显示拆包
        let roomSize:String? = kerry.residence?.info?.size //使用可选链，返回的是可选类型
        let roomSize1 = kerry.residence?.info?.size //使用可选链，返回的是可选类型
        let roomSize3 = kerry.residence!.info!.size //显示拆包
        print("kerry'roomNum = \(roomNum2)\nkerry'roomNum = \(roomNum3)\nkerry'roomSize = \(roomSize)\nkerry'roomSize = \(roomSize1)\nkerry'roomSize = \(roomSize3)")
    }

    // MARK: --- didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // TODO: 释放资源
        // Dispose of any resources that can be recreated.
    }
}

class Person {
    //名字
    var name:String = "dengketao"
    //住宅
    var residence: Residence?
}

class Residence {
    //住宅信息
    var info: Info?
}

class Info {
    //房间数
    var numberOfRooms:Int64 = 8
    //占地大小
    var size:String = "120平方"
}
