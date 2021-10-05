//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/05.
//  BOJ-2178

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (rows, cols) = (input[0], input[1])
var board: [[Int]] = []
var dist = Array(repeating: Array(repeating: -1, count: cols+5), count: rows+5)
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

for _ in 0..<rows {
    let line = readLine()!.map { Int(String($0))! }
    board.append(line)
}

var leftStack: [[Int]] = []
var rightStack: [[Int]] = []

func dequeue() -> [Int] {
    if leftStack.isEmpty {
        leftStack = rightStack.reversed()
        rightStack.removeAll()
    }
    return leftStack.popLast()!
}

rightStack.append([0,0])
dist[0][0] = 1

while !leftStack.isEmpty || !rightStack.isEmpty {
    let cur = dequeue()
    for i in 0..<4 {
        let x = cur[0] + dx[i]
        let y = cur[1] + dy[i]
        
        // 범위검사
        if x < 0 || x >= rows || y < 0 || y >= cols { continue }
        // 방문, 유효 칸 검사
        if dist[x][y] != -1 || board[x][y] == 0 { continue }
        
        // 방문(거리 더하기), queue에 append
        dist[x][y] = dist[cur[0]][cur[1]] + 1
        rightStack.append([x, y])
    }
}

print(dist[rows-1][cols-1])
