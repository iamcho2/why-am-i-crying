//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/01.
//

import Foundation

var max = 0
var maxIdx = 0

for idx in 0...8 {
    let input = readLine()!.split(separator: " ")
    
    if let num = Int(input[0]) {
        if num > max {
            max = num
            maxIdx = idx + 1
        }
    }
}

print(max, maxIdx)
