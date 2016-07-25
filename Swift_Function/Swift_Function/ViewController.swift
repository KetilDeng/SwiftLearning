//
//  ViewController.swift
//  Swift_Function
//
//  Created by Kerry on 16/5/31.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sayHello(to: "dengtao", and: "world")
        
        self.someFunction(4, 7)
        
        self.someFunction2(4, secondParameter: 7)
        
        self.addition(firstNum: 1.0, others: 2.0, 3.0, 4.0)
        
        var a = 88
        var b = 99
        self.swapTwoNum(&a, &b)
        
        let mathFunction:(Double, Double...) -> Double = addition
        self.printMathResult(mathFunction, 1, 1)
        
    }
    
    //函数参数都有一个外部参数名（external parameter name）和一个局部参数名（local parameter name）。外部参数名用于在函数调用时标注传递给函数的参数，局部参数名在函数的实现内部使用。
    
    //一般情况下，第一个参数省略其外部参数名，第二个以及随后的参数使用其局部参数名作为外部参数名。所有参数必须有独一无二的局部参数名。
    func someFunction2(firstParameter:Int, secondParameter:Int)
    {
        print("frist:\(firstParameter), second:\(secondParameter)")
    }
    
    //为每个参数指定外部参数名后，在你调用sayHello(to:and:)函数时两个外部参数名都必须写出来。
    func sayHello(to aPerson:String, and anotherPerson:String)
    {
        print("hello,\(aPerson),\(anotherPerson)")
    }
    
    //如果你不想为第二个及后续的参数设置外部参数名，用一个下划线（_）代替一个明确的参数名。
    func someFunction(firstParameter:Int, _ secondParameter:Int)
    {
        print("frist:\(firstParameter), second:\(secondParameter)")
    }
    
    //可变参数
    /*函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。
    
    定义一个输入输出参数时，在参数定义前加 inout 关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。想获取更多的关于输入输出参数的细节和相关的编译器优化，请查看输入输出参数一节。
    
    你只能传递变量给输入输出参数。你不能传入常量或者字面量（literal value），因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数名前加&符，表示这个值可以被函数修改。*/

    func addition(firstNum aNum:Double, others:Double...) -> Double
    {
        var total = aNum
        for num in others
        {
            total += num
        }
        
        print("total:\(total)")
        return total
    }
    
    //输入输出参数
    func swapTwoNum(inout a:Int, inout _ b:Int)
    {
        print("before : a = \(a)   b = \(b)")
        let tempNum = b
        b = a
        a = tempNum
        print("after: a = \(a)   b = \(b)")
    }
    
    func printMathResult(mathFunction: (Double, Double...) -> Double, _ aValue:Double, _ bValue:Double)
    {
        print("result:\(addition(firstNum: aValue, others: bValue))")
    }
    
    func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

