//
//  main.swift
//  lesson_24
//
//  Created by greatkk on 2019/5/28.
//  Copyright © 2019 greatkk. All rights reserved.
//

import Foundation

//访问控制可以限定其它源文件或模块中的代码对你的代码的访问级别。这个特性可以让我们隐藏代码的一些实现细节，并且可以为其他人可以访问和使用的代码提供接口。Swift 不仅提供了多种不同的访问级别，还为某些典型场景提供了默认的访问级别，这样就不需要我们在每段代码中都申明显式访问级别。其实，如果只是开发一个单一 target 的应用程序，我们完全可以不用显式声明代码的访问级别。

//Swift 中的访问控制模型基于模块和源文件这两个概念,模块指的是独立的代码单元，框架或应用程序会作为一个独立的模块来构建和发布。在 Swift 中，一个模块可以使用 import 关键字导入另外一个模块。在 Swift 中，Xcode 的每个 target（例如框架或应用程序）都被当作独立的模块处理。如果你是为了实现某个通用的功能，或者是为了封装一些常用方法而将代码打包成独立的框架，这个框架就是 Swift 中的一个模块。当它被导入到某个应用程序或者其他框架时，框架内容都将属于这个独立的模块。源文件就是 Swift 中的源代码文件，它通常属于一个模块，即一个应用程序或者框架。尽管我们一般会将不同的类型分别定义在不同的源文件中，但是同一个源文件也可以包含多个类型、函数之类的定义。
/*
 Swift 为代码中的实体提供了五种不同的访问级别。这些访问级别不仅与源文件中定义的实体相关，同时也与源文件所属的模块相关。
 
 Open 和 Public 级别可以让实体被同一模块源文件中的所有实体访问，在模块外也可以通过导入该模块来访问源文件里的所有实体。通常情况下，你会使用 Open 或 Public 级别来指定框架的外部接口。Open 和 Public 的区别在后面会提到。
 Internal 级别让实体被同一模块源文件中的任何实体访问，但是不能被模块外的实体访问。通常情况下，如果某个接口只在应用程序或框架内部使用，就可以将其设置为 Internal 级别。
 File-private 限制实体只能在其定义的文件内部访问。如果功能的部分细节只需要在文件内使用时，可以使用 File-private 来将其隐藏。
 Private 限制实体只能在其定义的作用域，以及同一文件内的 extension 访问。如果功能的部分细节只需要在当前作用域内使用时，可以使用 Private 来将其隐藏。
 Open 为最高访问级别（限制最少），Private 为最低访问级别（限制最多）。
 
 Open 只能作用于类和类的成员，它和 Public 的区别如下：
 
 Public 或者其它更严访问级别的类，只能在其定义的模块内部被继承。
 Public 或者其它更严访问级别的类成员，只能在其定义的模块内部的子类中重写。
 Open 的类，可以在其定义的模块中被继承，也可以在引用它的模块中被继承。
 Open 的类成员，可以在其定义的模块中子类中重写，也可以在引用它的模块中的子类重写。
 */
/*
Open 只能作用于类和类的成员，它和 Public 的区别如下：

Public 或者其它更严访问级别的类，只能在其定义的模块内部被继承。
Public 或者其它更严访问级别的类成员，只能在其定义的模块内部的子类中重写。
Open 的类，可以在其定义的模块中被继承，也可以在引用它的模块中被继承。
Open 的类成员，可以在其定义的模块中子类中重写，也可以在引用它的模块中的子类重写。
 把一个类标记为 open，明确的表示你已经充分考虑过外部模块使用此类作为父类的影响，并且设计好了你的类的代码了。
*/
//Swift 中的访问级别遵循一个基本原则：不可以在某个实体中定义访问级别更低（更严格）的实体。

//通过修饰符 open，public，internal，fileprivate，private 来声明实体的访问级别：

public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}
//函数的访问级别根据访问级别最严格的参数类型或返回类型的访问级别来决定。但是，如果这种访问级别不符合函数定义所在环境的默认访问级别，那么就需要明确地指定该函数的访问级别。下面的例子定义了一个名为 someFunction() 的全局函数，并且没有明确地指定其访问级别。也许你会认为该函数应该拥有默认的访问级别 internal，但事实并非如此。事实上，如果按下面这种写法，代码将无法通过编译：

//func someFunction() -> (SomeInternalClass, SomePrivateClass) {
//    // 此处是函数实现部分
//}

//我们可以看到，这个函数的返回类型是一个元组，该元组中包含两个自定义的类（可查阅自定义类型）。其中一个类的访问级别是 internal，另一个的访问级别是 private，所以根据元组访问级别的原则，该元组的访问级别是 private（元组的访问级别与元组中访问级别最低的类型一致）。

//因为该函数返回类型的访问级别是 private，所以你必须使用 private 修饰符，明确指定该函数的访问级别：

private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // 此处是函数实现部分
    return (SomeInternalClass(),SomePrivateClass())
}

//枚举成员的访问级别和该枚举类型相同，你不能为枚举成员单独指定不同的访问级别。
public enum CompassPoint {
    case North
    case South
    case East
    case West
}
//子类的访问级别不得高于父类的访问级别

