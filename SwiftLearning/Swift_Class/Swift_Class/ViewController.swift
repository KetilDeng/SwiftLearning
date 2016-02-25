//
//  ViewController.swift
//  Swift_Class
//
//  Created by Kerry on 16/2/24.
//  Copyright © 2016年 DKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let someClass = SomeClass()
        someClass.value2 = "hello world"
        let str = SomeClass.value3
        someClass.teachers = 10
        print(str)
        print(someClass.value2!)
        
        someClass.add()
        someClass.add()
        someClass.add()
        someClass.subtraction(1)
        someClass.reset()
        SomeClass.classMethod()
        
        let subClass = SubClass()
        subClass.add()
        SubClass.classMethod()
        subClass.myMethod("!")
        
        let subClass2 = SubClass2()
        subClass2[0] = 5
        subClass2[1] = 6
        print(subClass2[0])
        print(subClass2[1])
        let c = subClass2.additive(1,b: 2)
        print(c)
        
        additive(1, b: 3)
        printAddResult(additive, a: 4, b: 5)
        
        print(mainFunc())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class SomeClass {
    var value1 = 0
    var value2:String?
    
    var cal:Int{
        get{
            return 10
        }
        set(newValue){
            value1 = newValue
        }
    }
    
    class var value3:String{
        return "hello"
    }
    
    var teachers:Int = 3{
        
        willSet(newTeachers){
            print("\(newTeachers)")
        }
        didSet(oldTeachers){
            if teachers > oldTeachers{
                print("\(teachers - oldTeachers)")
            }
        }
    }
    
    func add(){
        value1++
        print(value1)
    }
    
    func subtraction(amount:Int){
        value1 -= amount
        print(value1)
    }
    
    func reset(){
        value1 = 0
        print(value1)
    }
    
    class func classMethod(){
        print("我是类方法")
    }
}

class SubClass: SomeClass {
    var str:String?
    
    override func add() {
        value1 += 5
        print("我重写了父类的实例方法")
    }
    
    override class func classMethod(){
        print("我重写了父类的类方法")
    }
    
    func myMethod(aCh:Character){
        self.str = "hello world "
        self.str!.append(aCh)
        print(self.str!)
    }
}

class SubClass2:SomeClass {
    var age:[Int] = Array(count: 5, repeatedValue: 0)
    subscript(index:Int) -> Int{
        get{
            return age[index]
        }
        set{
            age[index] = newValue
        }
    }
    
    func additive(a:Int,b:Int) -> Int{
        return a + b
    }
}

func additive(a:Int,b:Int) -> Int{
    print("（int:int） -> int")
    return a + b
}

func printAddResult(addFun:(Int,Int)->Int , a:Int , b:Int){
    print("result:\(addFun(a,b))")
}

func mainFunc() -> Int{
    func interanlFunc(input:Int) -> Int{
        return input
    }
    return interanlFunc(99)
}


