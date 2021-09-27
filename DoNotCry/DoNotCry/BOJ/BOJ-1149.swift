//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/27.
//  BOJ-1149

import Foundation

let N = Int(String(readLine()!))!
var cost: [[Int]] = Array(repeating: [], count: 1005)
for i in 1...N {
    cost[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

var D: [[Int]] = Array(repeating: [0,0,0], count: 1005)
// D[i][j] = i번째 집까지 칠할 때 비용의 최솟값 (이 때, i번째 집은 j색)
D[0][0] = 0; D[0][1] = 0; D[0][2] = 0;
D[1] = cost[1]

for i in 2...N {
    D[i][0] = min(D[i-1][1], D[i-1][2]) + cost[i][0]
    D[i][1] = min(D[i-1][0], D[i-1][2]) + cost[i][1]
    D[i][2] = min(D[i-1][0], D[i-1][1]) + cost[i][2]
}

print(min(D[N][0], D[N][1], D[N][2]))
