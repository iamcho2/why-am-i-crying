//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/01.
//  BOJ-12852 - 다시풀기

import Foundation

var num = Int(String(readLine()!))!
var D = Array(repeating: 0, count: num+4)
var pre = Array(repeating: 0, count: num+4)

D[1] = 0
for i in 1...num {
    
    D[i] = D[i-1] + 1
    pre[i] = i-1
    
    if i % 2 == 0 && D[i] > D[i/2] + 1 {
        D[i] = D[i/2] + 1
        pre[i] = i/2
    }
    if i % 3 == 0 && D[i] > D[i/3] + 1 {
        D[i] = D[i/3] + 1
        pre[i] = i/3
    }
}

print(D[num]-1)
var cur = num
while(true) {
    print(cur, terminator: " ")
    if cur == 1 { break }
    cur = pre[cur]
}
