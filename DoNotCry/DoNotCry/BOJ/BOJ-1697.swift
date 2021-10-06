//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/05.
//  BOJ-1697

import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (input[0], input[1])
var dist = Array(repeating: -1, count: 100005)

var queue = [Int]()
queue.append(N)
dist[N] = 0

var head = 0
while head < queue.count {
    let cur = queue[head]
    head += 1
    
    let dx = [-1, 1, cur]
    for i in 0..<3 {
        let x = cur + dx[i]
        // 범위 검사
        if x < 0 || x > 100000 { continue }
        // 방문, 유효칸 검사
        if dist[x] != -1 { continue }
        // 동생만남
        if x == K {
            print(dist[cur] + 1)
            exit(0)
        }
        
        dist[x] = dist[cur] + 1
        queue.append(x)
    }
    
}
print(0)
