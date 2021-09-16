//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/17.
// BOJ-1003

import Foundation

var T = Int(String(readLine()!))!
var TC = Array(repeating: 0, count: T)

for idx in 0..<T {
    TC[idx] = Int(String(readLine()!))!
}

var D = Array(repeating: [0, 0], count: 50)
D[0] = [1, 0]; D[1] = [0, 1]; D[2] = [1, 1]

for count in 0..<T {
    
    if TC[count] > 2 {
        for idx in 3...TC[count] {
            if D[idx] == [0, 0] {
                D[idx][0] = D[idx-1][0] + D[idx-2][0]
                D[idx][1] = D[idx-1][1] + D[idx-2][1]
            }
        }
    }
    
    print(D[TC[count]][0], D[TC[count]][1])
}
