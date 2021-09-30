//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/30.
//  BOJ-11659

import Foundation

var D = Array(repeating: 0, count: 100001)

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
D[0] = 0; D[1] = arr[0]

for (idx, num) in arr.enumerated() {
    D[idx+1] = D[idx] + num
}

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    print( D[input[1] ] - D[input[0] - 1] )
}
