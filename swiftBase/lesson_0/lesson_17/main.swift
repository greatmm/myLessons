//
//  main.swift
//  lesson_17
//
//  Created by greatkk on 2019/5/28.
//  Copyright © 2019 greatkk. All rights reserved.
//

import Foundation
enum VendingMachineError: Error {
    case invalidSelection                     //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock                             //缺货
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

