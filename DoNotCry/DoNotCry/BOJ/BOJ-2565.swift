//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/22.
//  BOJ-2565

import Foundation

let count = Int(readLine()!)!
var arr = Array(repeating: [0,0], count: count)

for i in 0..<count {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr[i][0] = temp[0]
    arr[i][1] = temp[1]
}

var d = Array(repeating: 0, count: count)

arr = arr.sorted(by: { $0[0] < $1[0] })

// 초기 값
d[0] = 1

for i in 1..<count {
    
    var max = Int.min
    for j in 0..<i {
        if arr[j][1] < arr[i][1] {
            if d[j] > max { max = d[j] }
        }
    }
    d[i] = max == Int.min ? 1 : max + 1
    
}

print(count-d.max()!)
