//
//  main.swift
//  lesson_0
//
//  Created by greatkk on 2019/5/26.
//  Copyright © 2019 greatkk. All rights reserved.
//
import Foundation

let x = 0, y = 0, z = 0
var a,b,c : Int
a = 3
b = Int(4.0)
print(b,y)
let minValue = UInt8.min  // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max  // maxValue 为 255，是 UInt8 类型
print(minValue,maxValue)

/*
 在32位平台上，Int 和 Int32 长度相同。
 在64位平台上，Int 和 Int64 长度相同。
 Double表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。
 Float表示32位浮点数。精度要求不高的话可以使用此类型。
 Double精确度很高，至少有15位数字，而Float只有6位数字。选择哪个类型取决于你的代码需要处理的值的范围，在两种类型都匹配的情况下，将优先选择 Double
 */
let d:Int? = nil
let e = d ?? 10
print(e)
/*
 你可以包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行。只要有任意一个可选绑定的值为nil，或者任意一个布尔条件为false，则整个if条件判断为false，这时你就需要使用嵌套 if 条件语句来处理，如下所示：
 */
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
enum OperationError : Error {
    case ErrorOne
    case ErrorTwo
    case ErrorThree(String)
    case ErrorOther
}
func numberTest(num:Int) throws{
    if num == 1 {
        print("成功")
    }else if num == 2 {
        throw OperationError.ErrorTwo
    }else if num == 3{
        throw OperationError.ErrorThree("失败")
    }else {
        throw OperationError.ErrorOther
    }
}
func throwDeliver(num:Int) throws ->String {
    print("错误传递")
    try numberTest(num: num)
    print("未传递错误")
    return "无错误"
}
let str = try throwDeliver(num: 1)
print(str)
let age = -3
//assert(age > 0,"年龄错误了")

//precondition(age >= 0, "强制执行先决条件")


