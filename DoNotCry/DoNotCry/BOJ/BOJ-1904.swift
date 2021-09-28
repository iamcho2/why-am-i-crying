//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/28.
//  BOJ-1904

import Foundation

var N = Int(String(readLine()!))!
var D = Array(repeating: 0, count: 1000001)
D[0] = 0; D[1] = 1; D[2] = 2

if N < 3 {
    print(D[N] % 15746)
} else {
    for i in 3...N {
        D[i] = (D[i-1] &+ D[i-2]) % 15746
    }
    print(D[N])
}
