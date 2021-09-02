//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/03.
// BOJ-15650

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr = Array(repeating: 0, count: 10)
var isUsed = Array(repeating: false, count: 10)
var current: Int = 1

func makeAscendingPm(_ num: Int) {
    
    // base condition
    if num == input[1] {
        for idx in 0..<num {
            print(arr[idx], terminator: " ")
        }
        print("")
        return
    }
    
    for i in current...input[0] {
        if !isUsed[i] {
            arr[num] = i
            isUsed[i] = true
            current = i
            makeAscendingPm(num + 1)
            isUsed[i] = false
        }
    }
}

makeAscendingPm(0)
