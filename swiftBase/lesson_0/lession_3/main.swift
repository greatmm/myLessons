//
//  main.swift
//  lession_3
//
//  Created by greatkk on 2019/5/27.
//  Copyright © 2019 greatkk. All rights reserved.
//

import Foundation
//数组
var someInts = [Int]()
someInts.append(1)
someInts = []
someInts += [1,2,3,4,5]
//创建一个带有默认值的数组
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
//使用布尔属性isEmpty作为一个缩写形式去检查count属性是否为0：
someInts.isEmpty

someInts[0...3] = [9,0,8];
print(someInts)
someInts.insert(10, at: 3)
print(someInts)
someInts.remove(at: 2)
for item in someInts {
    print(item)
}
//如果我们同时需要每个数据项的值和索引值，可以使用enumerated()方法来进行数组遍历。enumerated()返回一个由每一个数据项索引值和数据值组成的元组。我们可以把这个元组分解成临时常量或者变量来进行遍历：

for (index, value) in someInts.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}
someInts.removeAll()
//集合
var letters = Set<Character>()
letters.insert("a")
letters = []

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
favoriteGenres.insert("Jazz")
favoriteGenres.contains("Rock")
favoriteGenres.remove("Rock")
favoriteGenres.removeAll()
for genre in favoriteGenres {
    print("\(genre)")
}
//Swift 的Set类型没有确定的顺序，为了按照特定顺序来遍历一个Set中的值可以使用sorted()方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定.
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

//使用intersection(_:)方法根据两个集合中都包含的值创建的一个新的集合。
//使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
//使用union(_:)方法根据两个集合的值创建一个新的集合。
//使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合。
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

//使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
//使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
//使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
//使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
//使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)。
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true


//字典
var namesOfIntegers = [Int: String]()
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//作为另一种下标方法，字典的updateValue(_:forKey:)方法可以设置或者更新特定键对应的值。就像上面所示的下标示例，updateValue(_:forKey:)方法在这个键不存在对应值的时候会设置新值或者在存在时更新已存在的值。和上面的下标方法不同的，updateValue(_:forKey:)这个方法返回更新值之前的原值。这样使得我们可以检查更新是否成功。

//updateValue(_:forKey:)方法会返回对应值的类型的可选值。举例来说：对于存储String值的字典，这个函数会返回一个String?或者“可选 String”类型的值。

//如果有值存在于更新前，则这个可选值包含了旧值，否则它将会是nil。

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// 输出 "The old value for DUB was Dublin."

airports["APL"] = "Apple Internation"
airports["APL"] = nil
//removeValue(forKey:)方法也可以用来在字典中移除键值对。这个方法在键值对存在的情况下会移除该键值对并且返回被移除的值或者在没有值的情况下返回nil
airports.removeValue(forKey: "APL")
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: YYZ
// Airport code: LHR

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
// airportCodes 是 ["YYZ", "LHR"]

let airportNames = [String](airports.values)
// airportNames 是 ["Toronto Pearson", "London Heathrow"]
