//
//  初始化.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/18.
//  Copyright © 2016年 DKT. All rights reserved.
//

import Foundation

class ClassA {
    let numA:Int
    
    init(num:Int){
        numA = num
    }
    
//    required init(num:Int){
//        numA = num
//    }
    
    //便利构造器
    convenience init(bigNum:Bool){
        
        self.init(num: bigNum ? 1000:1)
    }
}

class ClassB: ClassA {
    
    let numB:Int
    
    override init(num:Int){
        numB = num + 1
        super.init(num: num)
    }
}

/* 
 在 Swift 1.1 中 Apple 已经为我们加上了初始化方法中返回 nil 的能力。我们可以在 init 声明时在其后加上一个 ? 或者 ! 来表示初始化失败时可能返回 nil。
 */
extension Int{
    
    init?(fromString:String){
        
        
        if fromString == "a"
        {
            self = 1
        }
        else if fromString == "b"
        {
            self = 2
        }
        else
        {
            return nil
        }
    }
}

/**
    
 注意在 init 里我们可以对 let 的实例常量进行赋值，这是初始化方法的重要特点。在 Swift 中 let 声明的值是不变量，无法被写入赋值，这对于构建线程安全的 API 十分有用。而因为 Swift 的 init 只可能被调用一次，因此在 init 中我们可以为不变量进行赋值，而不会引起任何线程安全的问题。
 
 与 designated 初始化方法对应的是在 init 前加上 convenience 关键字的初始化方法。这类方法是 Swift 初始化方法中的 “二等公民”，只作为补充和提供使用上的方便。所有的 convenience 初始化方法都必须调用同一个类中的 designated 初始化完成设置，另外 convenience 的初始化方法是不能被子类重写或者是从子类中以 super 的方式被调用的”
 
 只要在子类中实现重写了父类 convenience 方法所需要的 init 方法的话，我们在子类中就也可以使用父类的 convenience 初始化方法了。比如在上面的代码中，我们在 ClassB 里实现了 init(num: Int) 的重写。这样，即使在 ClassB 中没有 bigNum 版本的 convenience init(bigNum: Bool)，我们仍然还是可以用这个方法来完成子类初始化
 
 */


/*
 初始化方法永远遵循以下两个原则：
 
 1 初始化路径必须保证对象完全初始化，这可以通过调用本类型的 designated 初始化方法来得到保证；
 2 子类的 designated 初始化方法必须调用父类的 designated 方法，以保证父类也完成初始化。”
 
 */

/*
    
 对于某些我们希望子类中一定实现的 designated 初始化方法，我们可以通过添加 required 关键字进行限制，强制子类对这个方法重写实现。这样做的最大的好处是可以保证依赖于某个designated 初始化方法的 convenience 一直可以被使用。一个现成的例子就是上面的 init(bigNum: Bool)：如果我们希望这个初始化方法对于子类一定可用，那么应当将 init(num: Int) 声明为必须，这样我们在子类中调用 init(bigNum: Bool) 时就始终能够找到一条完全初始化的路径了
 
 另外需要说明的是，其实不仅仅是对 designated 初始化方法，对于 convenience 的初始化方法，我们也可以加上 required 以确保子类对其进行实现。这在要求子类不直接使用父类中的 convenience 初始化方法时会非常有帮助。
 
 */