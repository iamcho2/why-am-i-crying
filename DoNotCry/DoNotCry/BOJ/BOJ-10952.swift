//
//  File.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/01.
// 10952

import Foundation

var numA = 1
var numB = 1

while numA != 0 && numB != 0 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    numA = input[0]
    numB = input[1]
    
    if numA + numB != 0 {
        print(numA + numB)
    }
}
