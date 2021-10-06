//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/06.
//

import Foundation
let T = Int(String(readLine()!))!
let dx = [-2, -1, -2, -1, 1, 2, 1, 2]
let dy = [1, 2, -1, -2, 2, 1, -2, -1]
for _ in 0..<T {
    
    let rows = Int(String(readLine()!))!
    var board = Array(repeating: Array(repeating: 0, count: rows), count: rows)
    var dist = Array(repeating: Array(repeating: -1, count: rows), count: rows)
    
    let first = readLine()!.split(separator: " ").map { Int(String($0))! }
    dist[first[0]][first[1]] = 0
    
    // 초깃값 넣기
    var queue = [(Int, Int)]()
    queue.append((first[0], first[1]))
    
    // 도착지 넣기
    let dest = readLine()!.split(separator: " ").map { Int(String($0))! }
    board[dest[0]][dest[1]] = 999
    
    // 시작점 == 도착지일 때
    if first == dest {
        print(0)
        continue
    }
    
    var head = 0
    
    while head < queue.count {
        let cur = queue[head]
        head += 1
        
        for i in 0..<8 {
            let x = cur.0 + dx[i]
            let y = cur.1 + dy[i]
            
            if x < 0 || x >= rows || y < 0 || y >= rows { continue }
            
            if dist[x][y] != -1 { continue }
            // 도착지 만났을 때
            if board[x][y] == 999 {
                print(dist[cur.0][cur.1] + 1)
            }
            
            dist[x][y] = dist[cur.0][cur.1] + 1
            queue.append((x, y))
        }
    }
}
