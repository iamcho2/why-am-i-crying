//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/11/01.
//  BOJ-1707

import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    
    let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
    var graph = Array(repeating: [Int](), count: ve[0]+1)
    for _ in 0..<ve[1] {
        let link = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[link[0]].append(link[1])
        graph[link[1]].append(link[0]) // 양방향 그래프
    }
    // -1 : 색 없음, 0 : 색a, 1 : 색b
    var color = Array(repeating: -1, count: ve[0] + 1)
    var isCorrect = true
    
    for i in 1..<ve[0] {
        if !isCorrect { break }
        // 방문 체크
        if color[i] != -1 { continue }
        
        var queue = [i]
        var head = 0
        color[i] = 0
        
        while head < queue.count && isCorrect {
            let cur = queue[head]
            head += 1
            
            for vertex in graph[cur] {
                if color[vertex] == -1 {
                    if color[cur] == 0 {
                        color[vertex] = 1
                    } else {
                        color[vertex] = 0
                    }
                    queue.append(vertex)
                } else if color[vertex] == color[cur] {
                    isCorrect = false
                    break
                }
            }
        }
    }
    print(isCorrect ? "YES" : "NO")
}
