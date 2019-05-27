//
//  main.swift
//  lesson_1
//
//  Created by greatkk on 2019/5/26.
//  Copyright © 2019 greatkk. All rights reserved.
//

import Foundation

//区间
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}
//单侧区间
for name in names[2...] {
    print(name)
}
for name in names[...2] {
    print(name)
}
for name in names[..<2] {
    print(name)
}

let range = ...5
let a = range.contains(7)   // false
let b = range.contains(4)   // true
let c = range.contains(-1)  // true
print(a,b,c)
