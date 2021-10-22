//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/22.
//  BOJ-14467

import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: -1, count: 11)
var answer = 0

for _ in 0..<N {
    let cow = readLine()!.split(separator: " ").map { Int(String($0))! }
    if arr[cow[0]] == -1 {
        arr[cow[0]] = cow[1]
    } else {
        if arr[cow[0]] != cow[1] {
            answer += 1
        }
        arr[cow[0]] = cow[1]
    }
}

print(answer)
