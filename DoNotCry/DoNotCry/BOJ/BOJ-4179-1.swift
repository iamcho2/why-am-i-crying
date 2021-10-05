//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/05.
//  BOJ-4179-1

import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (rows, cols) = (input[0], input[1])
var maze = [[String]]()
var dist = Array(repeating: Array(repeating: 999, count: cols), count: rows)

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]
var jihunStart = (0, 0)
var fireStart = (0, 0)

for i in 0..<rows {
    let line = readLine()!.map { String($0) }
    maze.append(line)
    if line.contains("J") {
        let jCol = line.firstIndex(of: "J")!
        jihunStart = (i, jCol)
    }
}

var jihunQueue = [jihunStart]
var fireQueue = [(Int, Int)]()
var nextFireQueue = [(Int, Int)]()
var nextJihunQueue = [(Int, Int)]()

// 처음 불 시작하는 곳들 미리 다 fireQueue에 append
for i in 0..<rows {
    for j in 0..<cols {
        if maze[i][j] == "F" {
            fireQueue.append((i, j))
        }
    }
}


dist[jihunStart.0][jihunStart.1] = 0

repeat {
    var head = 0
    
    // fire queue 1번 bfs
    var fireHead = 0
    while fireHead < fireQueue.count {
        let curFire = fireQueue[fireHead]
        fireHead += 1
        
        // 상하좌우 불 확산 먼저
        for i in 0..<4 {
            let fx = curFire.0 + dx[i]
            let fy = curFire.1 + dy[i]
            
            // 범위 검사
            if fx < 0 || fx >= rows || fy < 0 || fy >= cols { continue }
            if maze[fx][fy] == "F" || maze[fx][fy] == "#" || maze[fx][fy] == "J" { continue }
            // 방문, 유효 칸 검사
            maze[fx][fy] = "F"
            nextFireQueue.append((fx, fy))
        }
    }
    
    // 다음 차례 불 확산 준비
    fireQueue = nextFireQueue
    nextFireQueue.removeAll()
    
    // 지훈이 분신들 1번 bfs
    while head < jihunQueue.count {
        let curJihun = jihunQueue[head]
        head += 1
        // 지훈이 전진
        for i in 0..<4 {
            let x = curJihun.0 + dx[i]
            let y = curJihun.1 + dy[i]
            
            // 범위 검사
            if x < 0 || x >= rows || y < 0 || y >= cols { continue }
            // 방문, 유효 칸 검사
            if dist[x][y] != 999 || maze[x][y] != "." { continue }
            // 방문처리, 거리 계산
            dist[x][y] = dist[curJihun.0][curJihun.1] + 1
            maze[x][y] = "J"
            nextJihunQueue.append((x, y))
        }
    }
    
    jihunQueue = nextJihunQueue
    nextJihunQueue.removeAll()
    
} while !jihunQueue.isEmpty


// 가장자리 줄에서 min값 출력
var minDist = Int.max
// 가로로 맨위, 맨아래
minDist = min(minDist, dist[0].min()!, dist[rows-1].min()!)
// 세로로 맨왼, 맨오른
for row in 0..<rows {
    minDist = min(minDist, dist[row][0], dist[row][cols-1])
}


if minDist == 999 {
    print("IMPOSSIBLE")
} else {
    print(minDist+1)
}
