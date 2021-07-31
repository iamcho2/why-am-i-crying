//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/01.
// 2920

import Foundation

let input = readLine()!.split(separator: " ").map { String($0) }
var string = ""

for idx in 0..<8 {
    string += input[idx]
}

if string == "12345678" {
    print("ascending")
} else if string == "87654321" {
    print("descending")
} else {
    print("mixed")
}
