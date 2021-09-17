//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/18.
// BOJ-1463

import Foundation

var N = Int(String(readLine()!))!
var D = [0, 0, 1, 1]

func min(_ a: Int, _ b: Int) -> Int {
    if a > b { return b }
    if a <= b { return a }
    return 0
}

if N > 3 {
    for i in 4...N {
        var minNum = D[i-1]
        
        if i % 2 == 0 {
            minNum = min(D[i/2], minNum)
        }
        if i % 3 == 0 {
            minNum = min(D[i/3], minNum)
        }
        
        D.append(minNum+1)
    }
}

print(D[N])
