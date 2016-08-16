//
//  命名空间.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/19.
//  Copyright © 2016年 DKT. All rights reserved.
//

import Foundation

struct MyClassContainer1 {
    
     class MyClass {
        class func hello() {
            print("hello from framework")
        }
    }
}

struct MyclassContainer2 {
    class MyClass {
        class func hello() {
            print("hello from framework")
        }
    }
}

/**
    MyClassContainer1.MyClass.hello()
    MyClassContainer2.MyClass.hello()
 
  */

/**
    使用类型嵌套的方法来指定访问的范围。
    常见做法是将名字重复的类型定义到不同的 struct 中，以此避免冲突。这样在不使用多个 module 的情况下也能取得隔离同样名字的类型的效果
 
*/

