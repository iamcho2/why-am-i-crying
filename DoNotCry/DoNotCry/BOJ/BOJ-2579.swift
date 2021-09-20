//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/19.
//  BOJ-2579

import Foundation

var stairCount = Int(String(readLine()!))!
var S: [Int] = [0]
var D: [[Int]] = Array(repeating: [0,0,0], count: 310)
for _ in 0..<stairCount {
    S.append(Int(String(readLine()!))!)
}

// D 초깃값
D[0][0] = 0; D[0][1] = 0; D[0][2] = 0;
D[1][0] = 0; D[1][1] = S[1]; D[1][2] = 0;
if stairCount >= 2 {
    D[2][0] = 0; D[2][1] = S[2]; D[2][2] = S[1] + S[2];
}

if stairCount >= 3 {
    for i in 3...stairCount {
        D[i][0] = 0
        D[i][1] = max(D[i-2][1], D[i-2][2]) + S[i]
        D[i][2] = D[i-1][1] + S[i]
    }
}

print(max(D[stairCount][1], D[stairCount][2]))
