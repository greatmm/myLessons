//
//  main.swift
//  lesson_10
//
//  Created by greatkk on 2019/5/27.
//  Copyright © 2019 greatkk. All rights reserved.
//

import Foundation

//实例方法，类型方法

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
/*
 在实例方法中修改值类型
 结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。
 
 但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择可变(mutating)行为，然后就可以从其方法内部改变它的属性；并且这个方法做的任何改变都会在方法执行结束时写回到原始结构中。方法还可以给它隐含的self属性赋予一个全新的实例，这个新实例在方法结束时会替换现存实例。
 
 要使用可变方法，将关键字mutating 放到方法的func关键字之前就可以了：
 
 */
struct Point {
    var x = 0.0, y = 0.0
//    mutating func moveByX(deltaX: Double, y deltaY: Double) {
//        x += deltaX
//        y += deltaY
//    }
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// 打印 "The point is now at (3.0, 4.0)"

//类方法
class SomeClass {
    class func someTypeMethod() {
        // 在这里实现类型方法
    }
}
SomeClass.someTypeMethod()
