//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/01.
// BOJ-15649

import Foundation

let n = readLine()!.split(separator: " ").map { Int(String($0))! }
var pm: [Int] = Array(repeating: 0, count: 10)
var isUsed: [Bool] = Array(repeating: false, count: 10)

func makePm(num: Int) {
    // base condition
    if num == n[1] {
        for i in 0..<n[1] { print(pm[i], separator: " ", terminator: " ") }
        print("")
        return
    }
    
    for i in 1...n[0] {
        if !isUsed[i] {
            pm[num] = i
            isUsed[i] = true
            makePm(num: num + 1)
            isUsed[i] = false
        }
    }
    
}

makePm(num: 0)
