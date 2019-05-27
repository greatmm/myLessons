//
//  main.swift
//  lession_2
//
//  Created by greatkk on 2019/5/26.
//  Copyright © 2019 greatkk. All rights reserved.
//

import Foundation

//字符串可以通过传递一个值类型为Character的数组作为自变量来初始化：

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// 打印输出："Cat!🐱"

//Swift 的String类型是基于 Unicode 标量 建立的。 Unicode 标量是对应字符或者修饰符的唯一的21位数字，例如U+1F425表示小鸡表情(FRONT-FACING BABY CHICK) ("🐥")
//注意： Unicode 码位(code poing) 的范围是U+0000到U+D7FF或者U+E000到U+10FFFF。Unicode 标量不包括 Unicode 代理项(surrogate pair) 码位，其码位范围是U+D800到U+DFFF
//不是所有的21位 Unicode 标量都代表一个字符，因为有一些标量是留作未来分配的。已经代表一个典型字符的标量都有自己的名字
//每一个String值都有一个关联的索引(index)类型，String.Index，它对应着字符串中的每一个Character的位置。
let greeting = "Guten Tag!"
let a = greeting[greeting.startIndex]
// G
let b = greeting[greeting.index(before: greeting.endIndex)]
// !
let c = greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
//试图获取越界索引对应的 Character，将引发一个运行时错误。

//greeting[greeting.endIndex] // error
//greeting.index(after: greeting.endIndex) // error
//使用 indices 属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单个字符。

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
    print(index)
}
// 打印输出 "G u t e n T a g ! "

//插入和删除
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome 变量现在等于 "hello!"

welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
// welcome 变量现在等于 "hello there!"
welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome 现在等于 "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome 现在等于 "hello"
//注意： 您可以使用 insert(_:at:)、insert(contentsOf:at:)、remove(at:) 和  removeSubrange(_:) 方法在任意一个确认的并遵循 RangeReplaceableCollection 协议的类型里面，如上文所示是使用在 String 中，您也可以使用在 Array、Dictionary 和 Set 中。

let ind = greeting.index(of: ",") ?? greeting.endIndex
let beginning = greeting[..<ind]
// beginning 的值为 "Hello"

// 把结果转化为 String 以便长期存储。
let newString = String(beginning)

//注意 String 和 SubString 都遵循  StringProtocol<//apple_ref/swift/intf/s:s14StringProtocolP> 协议，这意味着操作字符串的函数使用 StringProtocol 会更加方便。你可以传入 String 或 SubString 去调用函数。

//字符串比较，如果两个字符串（或者两个字符）的可扩展的字形群集是标准相等的，那就认为它们是相等的。在这个情况下，即使可扩展的字形群集是有不同的 Unicode 标量构成的，只要它们有同样的语言意义和外观，就认为它们标准相等。
welcome.hasSuffix("wel")//后缀
welcome.hasPrefix("com")//前缀

let dogString = "Dog‼🐶"
//当一个 Unicode 字符串被写进文本文件或者其他储存时，字符串中的 Unicode 标量会用 Unicode 定义的几种编码格式（encoding forms）编码。每一个字符串中的小块编码都被称代码单元（code units）。这些包括 UTF-8 编码格式（编码字符串为8位的代码单元）， UTF-16 编码格式（编码字符串位16位的代码单元），以及 UTF-32 编码格式（编码字符串32位的代码单元）。

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
for codeUnit in dogString.unicodeScalars {
    print("\(codeUnit) ", terminator: "")
}
