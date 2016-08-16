//
//  Tuple.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/14.
//  Copyright © 2016年 DKT. All rights reserved.
//

import Foundation

class Custome {
    
    func swap<T>(inout a: T, inout b: T)
    {
        print("a:\(a)  b:\(b)")

        let temp = a
        a = b
        b = temp
        
        print("a:\(a)  b:\(b)")
    }
    
    func swapTuple<T>(inout a: T, inout b: T) {
        
        print("a:\(a)   b:\(b)")

        (a,b) = (b,a)
        
        print("a:\(a)   b:\(b)")
    }
}

