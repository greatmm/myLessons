//
//  main.swift
//  lession_8
//
//  Created by greatkk on 2019/5/27.
//  Copyright © 2019 greatkk. All rights reserved.
//

import Foundation
/*
Swift 中类和结构体有很多共同点。共同处在于：

定义属性用于存储值
定义方法用于提供功能
定义下标操作使得可以通过下标语法来访问实例所包含的值
定义构造器用于生成初始化值
通过扩展以增加默认实现的功能
实现协议以提供某种标准功能

与结构体相比，类还有如下的附加功能：

继承允许一个类继承另一个类的特征
类型转换允许在运行时检查和解释一个类实例的类型
析构器允许一个类实例释放任何其所被分配的资源
引用计数允许对一个类的多次引用

注意
结构体总是通过被复制的方式在代码中传递，不使用引用计数。
*/
class SomeClass {
    // 在这里定义类
}
struct SomeStructure {
    // 在这里定义结构体
}
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
var someResolution = Resolution()
someResolution.width = 100
let someVideoMode = VideoMode()

//与 Objective-C 语言不同的是，Swift 允许直接设置结构体属性的子属性。上面的最后一个例子，就是直接设置了someVideoMode中resolution属性的width这个子属性，以上操作并不需要重新为整个resolution属性设置新值。
let vga = Resolution(width:640, height: 480)
//与结构体不同，类实例没有默认的成员逐一构造器。
//结构体和枚举是值类型
//值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。

//实际上，在 Swift 中，所有的基本类型：整数（Integer）、浮点数（floating-point）、布尔值（Boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，并且在底层都是以结构体的形式所实现。

//在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制。

 let hd = Resolution(width: 1920, height: 1080)
 var cinema = hd
/*
 在以上示例中，声明了一个名为hd的常量，其值为一个初始化为全高清视频分辨率（1920 像素宽，1080 像素高）的Resolution实例。
 
 然后示例中又声明了一个名为cinema的变量，并将hd赋值给它。因为Resolution是一个结构体，所以cinema的值其实是hd的一个拷贝副本，而不是hd本身。尽管hd和cinema有着相同的宽（width）和高（height），但是在幕后它们是两个完全不同的实例。
 */
//类是引用类型
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print(tenEighty.frameRate,alsoTenEighty.frameRate)
/*
 因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例。（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）
 
 如果能够判定两个常量或者变量是否引用同一个类实例将会很有帮助。为了达到这个目的，Swift 内建了两个恒等运算符：
 
 等价于（===）
 不等价于（!==）
 运用这两个运算符检测两个常量或者变量是否引用同一个实例：
 
 if tenEighty === alsoTenEighty {
 print("tenEighty and alsoTenEighty refer to the same Resolution instance.")
 }
 //打印 "tenEighty and alsoTenEighty refer to the same Resolution instance."
 请注意，“等价于”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同：
 
 “等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
 “等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。

 按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
 
 该数据结构的主要目的是用来封装少量相关简单数据值。
 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
 该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
 该数据结构不需要去继承另一个既有类型的属性或者行为。
 */
