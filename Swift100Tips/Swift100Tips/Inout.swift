//
//  Inout.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/18.
//  Copyright © 2016年 DKT. All rights reserved.
//

import Foundation

class InoutClass {
    
    /**
     
     错误：
     
     func foo(x:Int){
        x = x + 1
     }
     等价于：
     func foo(let x:Int){
        x = x + 1
     }
     
     */

    
    func foo(inout x:Int){
        x = x + 1
    }
}
