//
//  typealias和泛型.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/25.
//  Copyright © 2016年 DKT. All rights reserved.
//

import Foundation

import UIKit

/**
 typealias 是用来为已经存在的类型重新定义名字的，通过命名，可以使代码变得更加清晰。
 */

public class Fanxing {
    
    typealias CallBackClosure = (sender:AnyObject?) -> Void
    var callBackClosure:CallBackClosure?
    
    
    typealias Location = CGPoint
    typealias Distance = Double
    func distanceBetweenPoint(location: Location,
                                 toLocation: Location) -> Distance {
        let dx = Distance(location.x - toLocation.x)
        let dy = Distance(location.y - toLocation.y)
        return sqrt(dx * dx + dy * dy)
    }
    
    let origin: Location = Location(x: 0, y: 0)
    let point: Location = Location(x: 1, y: 1)
    
    //let distance: Distance =  distanceBetweenPoint(origin, toLocation: point)
    
}

/**
 *
 */

#if flase
class Stack<T> {
    
    private var stackItems:[T] = []
    
    func pushItem(item:T) {
        stackItems.append(item)
    }
    
    func popItem(item:T) -> T? {
        
        let lastItem = stackItems.last
        stackItems.removeLast()
        return lastItem
    }
    
    func isItemInStack(item:T) -> Bool {
        var found = false
        for stackItem in stackItems {
            if stackItem == item { //编译报错!!!!!!!!!! 因为两个参数没有实现Equtable协议的话，类型值是不能进行比较的。实际上我们可以为泛型增加约束条件         来解决这个问题。在本例中，通过对第一行进行修改，我们让泛型T遵循Equatable协议
                found = true
            }
        }
        return found
    }
}
#endif


class Stack<T:Equatable> {
    private var stackItems:[T] = []
    
    func pushItem(item:T) {
        stackItems.append(item)
    }
    
    func popItem(item:T) -> T? {
        
        let lastItem = stackItems.last
        stackItems.removeLast()
        return lastItem
    }
    
    func isItemInStack(item:T) -> Bool {
        var found = false
        for stackItem in stackItems {
            if stackItem == item { //编译报错!!!!!!!!!!
                found = true
            }
        }
        return found
    }
}
