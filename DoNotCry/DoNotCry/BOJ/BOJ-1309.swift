//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/12/01.
//  BOJ-1309

import Foundation

let N = Int(readLine()!)!

// D[n][0] 비어있음, D[n][1] 왼쪽, D[n][2] 오른쪽
var D = Array(repeating: Array(repeating: 0, count: 3), count: N+1)

// 초깃값 설정
D[0][0] = 0; D[0][1] = 0; D[0][2] = 0
D[1][0] = 1; D[1][1] = 1; D[1][2] = 1

for i in stride(from: 2, to: N+1, by: 1) {
    let prevD = D[i-1]
    D[i][0] = (prevD[0] + prevD[1] + prevD[2]) % 9901
    D[i][1] = (prevD[0] + prevD[2]) % 9901
    D[i][2] = (prevD[0] + prevD[1]) % 9901
}
print((D[N][0] + D[N][1] + D[N][2]) % 9901)
