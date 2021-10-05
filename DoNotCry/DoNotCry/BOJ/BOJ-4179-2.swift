//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/05.
//  BOJ-4179-2

import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (rows, cols) = (input[0], input[1])
var maze = [[String]]()
var jihunDist = Array(repeating: Array(repeating: 999, count: cols), count: rows)
var fireDist = Array(repeating: Array(repeating: -1, count: cols), count: rows)

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

// init jihun
var jihunQueue = [jihunStart]
jihunDist[jihunStart.0][jihunStart.1] = 0

// init fire
var fireQueue = [(Int, Int)]()
// 처음 불 시작하는 곳들 미리 다 fireQueue에 append
for i in 0..<rows {
    for j in 0..<cols {
        if maze[i][j] == "F" {
            fireQueue.append((i, j))
            fireDist[i][j] = 0
        }
    }
}

// fire dist 계산
var firehead = 0
while firehead < fireQueue.count {
    let cur = fireQueue[firehead]
    firehead += 1
    
    for i in 0..<4 {
        let x = cur.0 + dx[i]
        let y = cur.1 + dy[i]
        
        // 범위 검사
        if x < 0 || x >= rows || y < 0 || y >= cols { continue }
        // 방문, 유효 칸 검사
        if fireDist[x][y] != -1 || maze[x][y] == "#" { continue }
        // 방문처리, 거리계산, 큐 append
        fireDist[x][y] = fireDist[cur.0][cur.1] + 1
        fireQueue.append((x, y))
    }
}

// 지훈이 bfs
var head = 0
while head < jihunQueue.count {
    let cur = jihunQueue[head]
    head += 1
    
    for i in 0..<4 {
        let x = cur.0 + dx[i]
        let y = cur.1 + dy[i]
        
        // 범위 검사
        if x < 0 || x >= rows || y < 0 || y >= cols {
            // 범위를 벗어났다는 것 == 탈출에 성공했다는 것.
            // 최초 탈출 시간 출력하고 exit
            print(jihunDist[cur.0][cur.1]+1)
            exit(0)
        }
        // 방문, 유효 칸 검사
        if jihunDist[x][y] != 999 || maze[x][y] == "#" { continue }
        // 불에 타죽는지 검사 !!!!!!!!!
        if fireDist[x][y] != -1 && jihunDist[cur.0][cur.1] + 1 >= fireDist[x][y] { continue }
        // 방문처리, 거리계산, 큐 append
        jihunDist[x][y] = jihunDist[cur.0][cur.1] + 1
        jihunQueue.append((x, y))
    }
}
print("IMPOSSIBLE") // 여기까지 온거면 탈출 못했다는거니까
