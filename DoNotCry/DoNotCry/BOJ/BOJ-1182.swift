//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/06.
//

import Foundation

let NS = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, S) = (NS[0], NS[1])

var answer = 0
var isUsed: [Bool] = Array(repeating: false, count: 30) // 제한은 20인데 넉넉하게 30

func sum(curSum: Int, idx: Int) {
    
    // base condition
    if idx == N {
        if curSum == S {
            answer += 1
            return
        }
        return
    }
    
    sum(curSum: curSum, idx: idx + 1)
    sum(curSum: curSum + arr[idx], idx: idx + 1)
    
}

sum(curSum: 0, idx: 0)

// S가 0일 때 공집합 제외
if S == 0 {
    print(answer - 1)
} else {
    print(answer)
}
