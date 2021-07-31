//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/01.
//

import Foundation

let numCount = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var max = input[0]
var min = input[0]

for idx in 1..<input.count {
    if input[idx] > max {
        max = input[idx]
    }
    if min > input[idx] {
        min = input[idx]
    }
}

print (min, max)
