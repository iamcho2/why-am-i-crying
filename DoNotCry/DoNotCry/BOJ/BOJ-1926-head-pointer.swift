//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/05.
//  BOJ-1926-head-pointer

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (rows, cols) = (input[0], input[1]) //N행 M열
var board = [[Int]]()
var vis = Array(repeating: Array(repeating: false, count: cols), count: rows)
for _ in 0..<rows {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var paintCount = 0
var maxArea = 0
var queue: [(Int, Int)] = []

for row in 0..<rows {
    for col in 0..<cols {
        if board[row][col] == 0 || vis[row][col] { continue }
        queue.removeAll()
        vis[row][col] = true
        queue.append((row, col))
        bfs()
    }
}

func bfs() {
    // head 포인터
    var head = 0
    var area = 1
    
    // removeFirst나 popLast가 없으니까, head로 queue를 다 비웠는지 검사해야 함
    while head < queue.count {
        // pop하고, head += 1
        let cur = queue[head]
        head += 1
        
        // 상하좌우 검사
        for i in 0..<4 {
            let x = cur.0 + dx[i]
            let y = cur.1 + dy[i]
            
            // 범위 검사
            if x < 0 || x >= rows || y < 0 || y >= cols { continue }
            // 방문, 유효칸 검사
            if board[x][y] == 0 || vis[x][y] { continue }
            // 방문, queue에 추가
            vis[x][y] = true
            queue.append((x, y))
            area += 1
        }
        
    }
    // 그림 다 찾았으니까 카운트, 넓이 비교
    paintCount += 1
    maxArea = max(maxArea, area)
}

print(paintCount)
print(maxArea)
