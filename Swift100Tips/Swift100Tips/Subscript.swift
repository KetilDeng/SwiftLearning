 //
//  Subscript.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/18.
//  Copyright © 2016年 DKT. All rights reserved.
//

import Foundation
/**
 
 下标语法：
 
    subscript(index: Int) -> Int {
        get {
            // 返回一个适当的 Int 类型的值
        }
        
        set(newValue) {
            // 执行适当的赋值操作
        }
    }
 
    newValue的类型和下标的返回类型相同。如同计算型属性，可以不指定 setter 的参数（newValue）。如果不指定参数，setter 会提供一个名为newValue的默认参数。
 */

struct Matrix {
    
    var index:Int = 0
    var value:[AnyObject]
    
    init(count:Int){
        value = Array(count:count, repeatedValue:0.0)
    }
    
    subscript(aIndext:Int) -> AnyObject{
        
        get {
            return value[aIndext]
        }
        
        set {
            value[aIndext] = newValue
        }
    
    }
    
}