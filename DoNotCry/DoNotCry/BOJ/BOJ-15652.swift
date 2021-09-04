//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/04.
// BOJ-15652

import Foundation

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr = Array(repeating: 0, count: 10)

var prevNum = 1

func makePm(num: Int) {
    // base condition
    if num == input[1] {
        for i in 0..<num {
            print(arr[i], terminator: " ")
        }
        print("")
        return
    }
    
    for i in prevNum...input[0] {
        arr[num] = i
        prevNum = i
        print("prevNum is \(i)")
        makePm(num: num+1)
        print("---makePm end---")
    }
}

makePm(num: 0)
