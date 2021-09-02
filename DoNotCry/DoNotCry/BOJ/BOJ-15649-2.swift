//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/03.
// BOJ - 15649 다시 풀기

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr = Array(repeating: 0, count: 10)
var isUsed = Array(repeating: false, count: 10)

func makePm(num: Int) {
    
    // 길이가 M이면
    if num == input[1] {
        // M 길이의 수열을 출력
        for idx in 0..<num {
            print(arr[idx], terminator: " ")
        }
        // 다 출력한 후 공백
        print("")
        return
    }
    
    for i in 1...input[0] {
        if !isUsed[i] {
            arr[num] = i
            isUsed[i] = true
            makePm(num: num+1)
            isUsed[i] = false
        }
    }
    
}

makePm(num: 0)
