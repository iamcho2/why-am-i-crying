//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/02.
//  BOJ-2156

import Foundation

let n = Int(String(readLine()!))!
var W = Array(repeating: 0, count: n+2) // W테이블은 잔에 들어있는 포도주의 양 배열
for i in 1...n {
    let num = Int(String(readLine()!))!
    W[i] = num
}

// 현재 잔을 마셨을 때
var D = Array(repeating: 0, count: n+5)
D[1] = W[1]
D[2] = W[1]+W[2]

if n > 2 {
    for i in 3...n {
        D[i] = max(D[i-3] + W[i] + W[i-1], D[i-2] + W[i], D[i-1])
    }
}

print(D[n])
