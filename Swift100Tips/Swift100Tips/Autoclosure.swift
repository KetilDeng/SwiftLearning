//
//  Autoclosure.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/17.
//  Copyright © 2016年 DKT. All rights reserved.
//

import Foundation

class AutoclosureClass {
    func loginIfTrue(@autoclosure predicate:() -> Bool) {
        
        if predicate() {
            print("login success")
        }
    }
}

/**
 *  @autoclosure 做的事情就是把一句表达式自动地封装成一个闭包 (closure)。这样有时候在语法上看起来就会非常漂亮。
    
    没有加@autoclosure之前，调用：logIfTrue({return 2 > 1}) 
                          或者 logIfTrue({2 > 1}) 
                          或者 logIfTrue{2 > 1}
    
    添加@autoclosure之后，调用：loginIfTrue(2 > 1)
 
 */
