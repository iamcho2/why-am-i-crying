//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/07/31.
//

import Foundation

let input = readLine()!
let inputs = input.split(separator: " ").map { Int($0)! }

let aMinusB = inputs[0] - inputs[1]

if aMinusB < 0 {
    print("<")
} else if aMinusB > 0 {
    print(">")
} else {
    print("==")
}
