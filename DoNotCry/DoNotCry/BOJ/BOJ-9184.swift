//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/27.
//  BOJ-9184

import Foundation

var w: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: -1, count: 105), count: 105), count: 105)

func w(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a <= 0 || b <= 0 || c <= 0 {
        return 1
    }
    if a > 20 || b > 20 || c > 20  {
        return w(20, 20, 20)
    }
    if w[a][b][c] != -1 {
        return w[a][b][c]
    }
    if a < b && b < c {
        w[a][b][c] = w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)
        return w[a][b][c]
    }
    
    w[a][b][c] = w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
    return w[a][b][c]
}

while(true) {
    var input = [0, 0, 0]
    input = readLine()!.split(separator: " ").map { Int(String($0))! }
    if input == [-1, -1, -1] { break }
    else {
        print("w(\(input[0]), \(input[1]), \(input[2])) =", w(input[0], input[1], input[2]))
    }
}
