//
//  Mutating.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/2.
//  Copyright © 2016年 DKT. All rights reserved.
//

import Foundation

import UIKit

protocol SomeProtocol {
    var num : Int {get}
    var color: UIColor {get set}
    
    mutating func change()
}

struct SomeStruct: SomeProtocol {
    var num = 7
    var color = UIColor.whiteColor()
    
    mutating func change()
    {
        color = UIColor.blackColor()
    }
}

class SomeClass: SomeProtocol {
    var num = 7
    var color = UIColor.whiteColor()
    
    func change(){
        num = 47
    }
}
/*
    Swift 的 protocol 不仅可以被 class 类型实现，也适用于 struct 和 enum。
    因为这个原因，我们在写给别人用的接口时需要多考虑是否使用 mutating 来修饰方法，
    比如定义为 mutating func change()。Swift 的 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量，
    所以如果你没在接口方法里写 mutating 的话，别人如果用 struct 或者 enum 来实现这个接口的话，就不能在方法里改变自己的变量了。
    比如上面的代码” 如果把 protocol 定义中的 mutating 去掉的话，SomeStruct 就怎么都过不了编译了：保持现有代码不变的话，会报错说没有实现接口；
    如果去掉 mutating 的话，会报错说不能改变结构体成员。这个接口的使用者的忧伤的眼神，相信你能想象得出。 
    另外，在使用 class 来实现带有 mutating 的方法的接口时，具体实现的前面是不需要加 mutating 修饰的，因为 class 可以随意更改自己的成员变量。
    所以说在接口里用 mutating 修饰方法，对于 class 的实现是完全透明，可以当作不存在的
 */

