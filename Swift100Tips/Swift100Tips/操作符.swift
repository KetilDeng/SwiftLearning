//
//  操作符.swift
//  Swift100Tips
//
//  Created by Kerry on 16/7/18.
//  Copyright © 2016年 DKT. All rights reserved.
//

import Foundation

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

//重载操作符
func +(left:Vector2D, right:Vector2D) -> Vector2D
{
    return Vector2D(x: left.x+right.x, y: left.y+right.y)
}

//自定义操作符。需要先对其进行声明，告诉编译器这个符号其实是一个操作符
infix operator +* {
    associativity none
    precedence 160
}

func +*(left:Vector2D, right:Vector2D) -> Double
{
    return left.x*right.x + left.y*right.y
}



/**
 precedence
 运算的优先级，越高的话越优先进行运算。Swift 中乘法和除法的优先级是 150，加法和减法是 140，这里我们定义点积优先级 160，就是说应该早于普通的乘除进行运算。”
 */

/*
 infix 
 表示要定义的是一个中位操作符，即前后都是输入；其他的修饰子还包括 prefix 和 postfix，不再赘述
 */

/*
 associativity
 定义了结合律，即如果多个同类的操作符顺序出现的计算顺序。比如常见的加法和减法都是 left，就是说多个加法同时出现时按照从左往右的顺序计算 (因为加法满足交换律，所以这个顺序无所谓，但是减法的话计算顺序就很重要了)。点乘的结果是一个 Double，不再会和其他点乘结合使用，所以这里写成 none
 */
