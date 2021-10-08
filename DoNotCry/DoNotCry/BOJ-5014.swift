//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/08.
//  BOJ-5014

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (F, S, G, U, D) = (input[0], input[1], input[2], input[3], input[4])

if S == G {
    print(0)
    exit(0)
}

var floor = Array(repeating: 0, count: F)
floor[G-1] = 999
var dist = Array(repeating: -1, count: F)
dist[S-1] = 0

let dx = [U, -D]

var queue = [Int]()
queue.append(S-1)
var head = 0

while head < queue.count {
    let cur = queue[head]
    head += 1
    
    for i in 0..<2 {
        let x = cur + dx[i]
        
        // 범위검사
        if x < 0 || x >= F { continue }
        // 방문, 검사
        if dist[x] != -1 { continue }
        // 유효 칸 검사
        if floor[x] == 999 {
            print( dist[cur] + 1 )
            exit(0)
        }
        // 방문처리, 큐에 append
        dist[x] = dist[cur] + 1
        queue.append(x)
    }
}
print("use the stairs")
