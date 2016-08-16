//
//  ViewController.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/2.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /**
            Sequence
         */
        let bookList = BookList()
        
        bookList.addBook(Book(name: "Swift", price: 12.5))
        bookList.addBook(Book(name: "iOS" , price: 10.5))
        bookList.addBook(Book(name: "Objc", price: 20.0))
        print("\n=============== Sequence ================")
        for book in bookList {
            print("\(book.name) 价格 ￥\(book.price)")
        }
        print("=============== Sequence ================")

        
        // MARK: Tuple

        var a:Int = 1
        var b:Int = 2
        var c:String = "c"
        var d:String = "d"
        let costome = Custome()
        //costome.swap(&a, b: &b)
        print("\n=============== Tuple ================")
        costome.swapTuple(&a, b: &b)
        costome.swapTuple(&c, b: &d)
        print("=============== Tuple ================")

        
        // MARK: Autoclosure
        let ketilAutoclosure = AutoclosureClass()
        print("\n=============== Autoclosure ================")
        ketilAutoclosure.loginIfTrue(2>1)
        print("=============== Autoclosure ================")

        
        // MARK: Swift 中的 ??
        var level:Int?
        var originLevel = 1
        var currentLevel = level ?? originLevel
        print("\n=============== Swift 中的 ?? ================")
        print("currentLevel:\(currentLevel)")
        print("=============== Swift 中的 ?? ================")
        
        // MARK: 初始化方法中返回 nil 的能力
        let num1 = Int(fromString:"a")
        let num2 = Int(fromString:"b")
        let num3 = Int(fromString:"ab")
        print("\n=============== 初始化方法中返回 nil 的能力 ================")
        print("num1:\(num1)\nnum2:\(num2)\nnum3:\(num3)")
        print("=============== 初始化方法中返回 nil 的能力 ================")
        
        // MARK: inout
        let aInout = InoutClass()
        var x = 1
        aInout.foo(&x)
        print("\n=============== inout ================")
        print("x:\(x)")
        print("=============== inout ================")
        
        // MARK: Subscript
        var matrix = Matrix(count:5)
        matrix[0] = 10.0
        matrix[1] = "hello"
        matrix[2] = 30
        matrix[3] = "world"
        
        print("\n=============== Subscript ================")
        print("\(matrix.value[0])")
        print("\(matrix.value[1])")
        print("\(matrix.value[2])")
        print("\(matrix.value[3])")
        print("=============== Subscript ================")
        
        // MARK: static和class
        print("\n=============== static和class ================")
        let myclass = MyClass()
        let mystruct = MyStruct()
        MyClass.foo()
        MyClass.bar()
        MyStruct.foo()
        //myclass.bar()
        //myclass.foo()
        //mystruct.foo()
        print("\n=============== static和class ================")
        
        let child = Child()
        child.method()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


