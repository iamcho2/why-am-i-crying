//
//  BOJ-1913.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/22.
//  BOJ-1913

import Foundation

let N = Int(readLine()!)!
let num = Int(readLine()!)!

var arr = Array(repeating: Array(repeating: 0, count: N), count: N)
var center = N / 2

arr[center][center] = 1

var cur = (center, center)
var curNum = 1

for n in 1...N/2 {
    
    // 한칸 위로
    cur = (cur.0-1, cur.1)
    curNum += 1
    arr[cur.0][cur.1] = curNum
    
    // 우회전해서 쭉
    while cur.1 + 1 <= center + n {
        cur = (cur.0, cur.1 + 1)
        curNum += 1
        arr[cur.0][cur.1] = curNum
    }
    
    // 밑으로 쭉
    while cur.0 + 1 <= center + n {
        cur = (cur.0 + 1, cur.1)
        curNum += 1
        arr[cur.0][cur.1] = curNum
    }
    
    // 왼쪽으로 쭉
    while cur.1 - 1 >= center - n {
        cur = (cur.0, cur.1 - 1)
        curNum += 1
        arr[cur.0][cur.1] = curNum
    }
    
    // 위로 쭉
    while cur.0 - 1 >= center - n {
        cur = (cur.0 - 1, cur.1)
        curNum += 1
        arr[cur.0][cur.1] = curNum
    }
}

var findNum = (0, 0)

for i in 0..<N {
    var string = "\(arr[i][0])"
    for j in 1..<N {
        string.append(" \(arr[i][j])")
    }
    print(string)
    
    if arr[i].contains(num) {
        findNum.0 = i+1
        findNum.1 = arr[i].firstIndex(of: num)!+1
    }
}
print(findNum.0, findNum.1)
