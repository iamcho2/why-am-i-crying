//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/04.
//  BOJ-1012

import Foundation
let T = Int(String(readLine()!))!
let dx: [Int] = [1, 0, -1, 0]
let dy: [Int] = [0, 1, 0, -1]

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (M, N, K) = (input[0], input[1], input[2])
    var arr = Array(repeating: Array(repeating: 0, count: M+2), count: N+2)
    for _ in 0..<K {
        let XY = readLine()!.split(separator: " ").map { Int(String($0))! }
        arr[XY[1]][XY[0]] = 1
    }
    
    var answer = 0
    var visited = Array(repeating: Array(repeating: false, count: M+2), count: N+2)
    
    for i in 0..<N {
        for j in 0..<M {
            if arr[i][j] == 0 || visited[i][j] { continue }
            answer += 1
            visited[i][j] = true
            
            var queue: [[Int]] = []
            queue.append([i, j])
            
            while !queue.isEmpty {
                let cur: [Int] = queue.removeFirst()
                for i in 0..<4 {
                    let nx = cur[0] + dx[i]
                    let ny = cur[1] + dy[i]
                    if nx < 0 || nx >= N || ny < 0 || ny >= M { continue }
                    if visited[nx][ny] || arr[nx][ny] != 1 { continue }
                    visited[nx][ny] = true
                    queue.append([nx, ny])
                }
            }
            
        }
    }
    
    print(answer)
}
