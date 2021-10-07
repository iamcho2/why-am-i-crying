//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/07.
//  BOJ-10026

import Foundation
let N = Int(String(readLine()!))!
var board = [[String]]()
var blindBoard = [[String]]()
var vis = Array(repeating: Array(repeating: false, count: N+2), count: N+2)
var blindVis = Array(repeating: Array(repeating: false, count: N+2), count: N+2)
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

for _ in 0..<N {
    let str = readLine()!
    board.append(str.map { String($0)} )
    let blindStr = str.replacingOccurrences(of: "G", with: "R")
    blindBoard.append(blindStr.map { String($0)} )
}

var areaCount = [0,0,0,0] //r, g, b, blind
var rQueue = [(Int, Int)]()
var gQueue = [(Int, Int)]()
var bQueue = [(Int, Int)]()
var rgQueue = [(Int, Int)]()
var rHead = 0
var gHead = 0
var bHead = 0
var rgHead = 0

func bfs(_ head: inout Int, _ queue: inout [(Int, Int)], _ color: String, _ isBlind: Bool) {
    
    while head < queue.count {
        
        if isBlind {
            if head < queue.count {
                let cur = queue[head]
                head += 1
                check(cur.0, cur.1, &blindBoard, &queue, "R", true)
            }
        } else {
            if head < queue.count {
                let cur = queue[head]
                head += 1
                check(cur.0, cur.1, &board, &queue, color, false)
            }
        }
    }
}

func check(_ curX: Int, _ curY: Int, _ board: inout [[String]], _ queue: inout [(Int, Int)], _ color: String, _ isBlind: Bool) {
    for i in 0..<4 {
        let x = curX + dx[i]
        let y = curY + dy[i]
        
        // 범위검사
        if x < 0 || x >= N || y < 0 || y >= N { continue }
        // 방문검사
        if isBlind {
            if blindVis[x][y] { continue }
        } else {
            if vis[x][y] { continue }
        }
        // 색 검사
        if board[x][y] != color { continue }
        // 방문체크, 큐 append
        
        if isBlind {
            blindVis[x][y] = true
        } else {
            vis[x][y] = true
        }
        
        queue.append((x, y))
    }
}

// 시작점 찾기
for i in 0..<N {
    for j in 0..<N {
        if !vis[i][j] {
            switch board[i][j] {
            case "R":
                rQueue.append((i, j))
                areaCount[0] += 1
                bfs(&rHead, &rQueue, "R", false)
            case "G":
                gQueue.append((i, j))
                areaCount[1] += 1
                bfs(&gHead, &gQueue, "G", false)
            case "B":
                bQueue.append((i, j))
                areaCount[2] += 1
                bfs(&bHead, &bQueue, "B", false)
            default:
                print("입력이상")
            }
        }
        if !blindVis[i][j] {
            switch blindBoard[i][j] {
            case "R":
                rgQueue.append((i, j))
                areaCount[3] += 1
                bfs(&rgHead, &rgQueue, "R", true)
            default:
                continue
            }
        }
    }
}

print(areaCount[0]+areaCount[1]+areaCount[2], areaCount[2]+areaCount[3])
