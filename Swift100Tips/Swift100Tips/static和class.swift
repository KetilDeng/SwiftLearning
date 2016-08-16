//
//  static和class.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/28.
//  Copyright © 2016年 DKT. All rights reserved.
//

import Foundation

/**
    Swift 中表示 “类型范围作用域” 这一概念有两个不同的关键字，它们分别是 static 和 class。这两个关键字确实都表达了这个意思，但是在其他一些语言，包括 Objective-C 中，我们并不会特别地区分类变量/类方法和静态变量/静态函数。但是在 Swift 的早期版本中中，这两个关键字却是不能用混的。
 
    在非 class 的类型上下文中，我们统一使用 static 来描述类型作用域。这包括在 enum 和 struct 中表述类型方法和类型属性时。在这两个值类型中，我们可以在类型范围内声明并使用存储属性，计算属性和方法。”
 
 */

struct Point {
    let x: Double
    let y: Double
    
    // 存储属性
    static let zero = Point(x: 0, y: 0)

    // 计算属性
    static var ones: [Point] {
        return [Point(x: 1, y: 1),
                Point(x: -1, y: 1),
                Point(x: 1, y: -1),
                Point(x: -1, y: -1)]
    }
    
    // 类型方法
    static func add(p1: Point, p2: Point) -> Point {
        return Point(x: p1.x + p2.x, y: p1.y + p2.y)
    }
}

protocol MyProtocol {
    static func foo() -> String
}

struct MyStruct:MyProtocol {
    static func foo() -> String {
        return "MyStruct"
    }
}

enum MyEnum:MyProtocol {
    static func foo() -> String {
        return "MyEnum"
    }
}

class MyClass: MyProtocol {
    
//    static func foo() -> String {
//        return "MyClass"
//    }
    
    // 或者
    
    class func foo() -> String {
        return "MyClass"
    }
    
    class func bar() -> String {
        return "bar"
    }
}
