//
//  main.swift
//  lesson_23
//
//  Created by greatkk on 2019/5/28.
//  Copyright © 2019 greatkk. All rights reserved.
//

import Foundation
/*
 内存访问的冲突会发生在你的代码尝试同时访问同一个存储地址的时侯。同一个存储地址的多个访问同时发生会造成不可预计或不一致的行为。在 Swift 里，有很多修改值的行为都会持续好几行代码，在修改值的过程中进行访问是有可能发生的。
 内存访问冲突有三种典型的状况：访问是读还是写，访问的时长，以及被访问的存储地址。特别是，当你有两个访问符合下列的情况：
 
 至少有一个是写访问
 它们访问的是同一个存储地址
 它们的访问在时间线上部分重叠
 读和写访问的区别很明显：一个写访问会改变存储地址，而读操作不会。存储地址会指向真正访问的位置 —— 例如，一个变量，常量或者属性。内存访问的时长要么是瞬时的，要么是长期的。
 如果一个访问不可能在其访问期间被其它代码访问，那么就是一个瞬时访问。基于这个特性，两个瞬时访问是不可能同时发生。大多数内存访问都是瞬时的。
 */
/*
 一个函数会对它所有的 in-out 参数进行长期写访问。in-out 参数的写访问会在所有非 in-out 参数处理完之后开始，直到函数执行完毕为止。如果有多个 in-out 参数，则写访问开始的顺序与参数的顺序一致。
 
 长期访问的存在会造成一个结果，你不能在原变量以 in-out 形式传入后访问原变量，即使作用域原则和访问权限允许 —— 任何访问原变量的行为都会造成冲突。
 */
var stepSize = 1

func increment(_ number: inout Int) {
//    number += stepSize
}

increment(&stepSize)
//在上面的代码里，stepSize 是一个全局变量，并且它可以在 increment(_:) 里正常访问。然而，对于  stepSize 的读访问与 number 的写访问重叠了。就像下面展示的那样，number 和 stepSize 都指向了同一个存储地址。同一块内存的读和写访问重叠了，就此产生了冲突。
// 复制一份副本
var copyOfStepSize = stepSize
increment(&copyOfStepSize)

// 更新原来的值
stepSize = copyOfStepSize
//长期写访问的存在还会造成另一种结果，往同一个函数的多个 in-out 参数里传入同一个变量也会产生冲突
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)  // 正常
//balance(&playerOneScore, &playerOneScore)
// 错误：playerOneScore 访问冲突
//上面的 balance(_:_:) 函数会将传入的两个参数平均化。将 playerOneScore 和 playerTwoScore 作为参数传入不会产生错误 —— 有两个访问重叠了，但它们访问的是不同的内存位置。相反，将 playerOneScore 作为参数同时传入就会产生冲突，因为它会发起两个写访问，同时访问同一个的存储地址。

//注意 因为操作符也是函数，它们也会对 in-out 参数进行长期访问。例如，假设 balance(_:_:) 是一个名为  <^> 的操作符函数，那么 playerOneScore <^> playerOneScore 也会造成像  balance(&playerOneScore, &playerOneScore) 一样的冲突。
//方法里 self 的访问冲突
//一个结构体的 mutating 方法会在调用期间对 self 进行写访问。例如，想象一下这么一个游戏，每一个玩家都有血量，受攻击时血量会下降，并且有能量，使用特殊技能时会减少能量。

struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}
//在上面的 restoreHealth() 方法里，一个对于 self 的写访问会从方法开始直到方法 return。在这种情况下，restoreHealth() 里的其它代码不可以对 Player 实例的属性发起重叠的访问。下面的  shareHealth(with:) 方法接受另一个 Player 的实例作为 in-out 参数，产生了访问重叠的可能性。
extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)  // 正常
//上面的例子里，调用 shareHealth(with:) 方法去把 oscar 玩家的血量分享给 maria 玩家并不会造成冲突。在方法调用期间会对 oscar 发起写访问，因为在 mutating 方法里 self 就是 oscar，同时对于 maria 也会发起写访问，因为 maria 作为 in-out 参数传入。过程如下，它们会访问内存的不同位置。即使两个写访问重叠了，它们也不会冲突。



//当然，如果你将 oscar 作为参数传入 shareHealth(with:) 里，就会产生冲突：

//oscar.shareHealth(with: &oscar)
// 错误：oscar 访问冲突
//mutating 方法在调用期间需要对 self 发起写访问，而同时 in-out 参数也需要写访问。在方法里，self 和  teammate 都指向了同一个存储地址.对于同一块内存同时进行两个写访问，并且它们重叠了，就此产生了冲突。
//如结构体，元组和枚举的类型都是由多个独立的值组成的，例如结构体的属性或元组的元素。因为它们都是值类型，修改值的任何一部分都是对于整个值的修改，意味着其中一个属性的读或写访问都需要访问整一个值。例如，元组元素的写访问重叠会产生冲突：

var playerInformation = (health: 10, energy: 20)
balance(&playerInformation.health, &playerInformation.energy)
// 错误：playerInformation 的属性访问冲突

