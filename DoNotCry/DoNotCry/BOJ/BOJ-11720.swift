//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/01.
//

import Foundation

let length = readLine()!
let fullNum = readLine()!.split(separator: " ").map{String($0)}
var sum = 0

let strArr = fullNum[0].map{String($0)}
for idx in 0..<strArr.count {
    sum += Int(strArr[idx])!
}

print(sum)
