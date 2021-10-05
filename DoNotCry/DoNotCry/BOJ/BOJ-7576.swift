//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/05.
//  BOJ-7576

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (cols, rows) = (input[0], input[1])
var board = [[Int]]()
var dist = Array(repeating: Array(repeating: -1, count: cols+5), count: rows+5)
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

for _ in 0..<rows {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}

var leftStack = [[Int]]()
var rightStack = [[Int]]()

func dequeue() -> [Int] {
    if leftStack.isEmpty {
        leftStack = rightStack.reversed()
        rightStack.removeAll()
    }
    return leftStack.popLast()!
}

// 처음부터 이미 익어있는 토마토들
for i in 0..<rows {
    for j in 0..<cols {
        if board[i][j] == 1 {
            rightStack.append([i, j])
            dist[i][j] = 0
        }
    }
}

while !leftStack.isEmpty || !rightStack.isEmpty {
    let cur = dequeue()
    for i in 0..<4 {
        let x = cur[0] + dx[i]
        let y = cur[1] + dy[i]
        
        // 범위 검사
        if x < 0 || x >= rows || y < 0 || y >= cols { continue }
        // 방문, 유효 칸 검사
        if board[x][y] != 0 || dist[x][y] != -1 { continue }
        
        // 방문 수행
        dist[x][y] = dist[cur[0]][cur[1]] + 1
        board[x][y] = 1
        rightStack.append([x, y])
    }
}

// 전체 토마토가 다 익었는지 확인, 동시에 최대 dist 계산
var maxDist = 0
for row in 0..<rows {
    if board[row].contains(0) {
        print(-1)
        exit(0)
    }
    let rowMax = dist[row].max()!
    maxDist = max(rowMax, maxDist)
}
print(maxDist)
