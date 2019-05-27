//
//  main.swift
//  lesson_12
//
//  Created by greatkk on 2019/5/28.
//  Copyright © 2019 greatkk. All rights reserved.
//

import Foundation

//下面的例子定义了一个叫Vehicle的基类。这个基类声明了一个名为currentSpeed，默认值是0.0的存储属性（属性类型推断为Double）。currentSpeed属性的值被一个String类型的只读计算型属性description使用，用来创建车辆的描述。

//Vehicle基类也定义了一个名为makeNoise的方法。这个方法实际上不为Vehicle实例做任何事，但之后将会被Vehicle的子类定制：

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}

//class SomeClass: SomeSuperclass {
//    // 这里是子类的定义
//}
class Bicycle: Vehicle {
    var hasBasket = false
}
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
    override func makeNoise() {
        print("Choo Choo")
    }
}
//子类可以为继承来的实例方法，类方法，实例属性，或下标提供自己定制的实现。我们把这种行为叫重写。如果要重写某个特性，你需要在重写定义的前面加上override关键字。这么做，你就表明了你是想提供一个重写版本，而非错误地提供了一个相同的定义。意外的重写行为可能会导致不可预知的错误，任何缺少override关键字的重写都会在编译时被诊断为错误。override关键字会提醒 Swift 编译器去检查该类的超类（或其中一个父类）是否有匹配重写版本的声明。这个检查可以确保你的重写定义是正确的
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
/*可以通过把方法，属性或下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可（例如：final var，final func，final class func，以及final subscript）。

如果你重写了带有final标记的方法，属性或下标，在编译时会报错。在类扩展中的方法，属性或下标也可以在扩展的定义里标记为 final 的。

你可以通过在关键字class前添加final修饰符（final class）来将整个类标记为 final 的。这样的类是不可被继承的，试图继承这样的类会导致编译报错。
*/
