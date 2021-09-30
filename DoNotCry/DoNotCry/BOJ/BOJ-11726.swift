//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/29.
//  BOJ-11726

import Foundation

var n = Int(String(readLine()!))!
var D = Array(repeating: 0, count: 1001)
D[0] = 0; D[1] = 1; D[2] = 2

if n > 2 {
    for i in 3...n {
        D[i] = (D[i-1] + D[i-2]) % 10007
    }
}

print(D[n])
