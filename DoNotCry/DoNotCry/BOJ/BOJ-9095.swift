//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/18.
//  BOJ-9095

import Foundation

var count = Int(String(readLine()!))!
var D = Array(repeating: 0, count: 15)
D[0] = 0; D[1] = 1; D[2] = 2; D[3] = 4

for _ in 1...count {
    let N = Int(String(readLine()!))!
    if N > 3 {
        for i in 4...N {
            if D[i] == 0 {
                D[i] = D[i-1] + D[i-2] + D[i-3]
            }
        }
    }
    print(D[N])
}
