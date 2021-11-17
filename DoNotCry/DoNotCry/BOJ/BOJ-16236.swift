//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/11/14.
//  BOJ-16236

import Foundation
let N = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: N), count: N)

// 사용할 변수들
var timeSecond = 0
var totalFish = Array(repeating: 0, count: 7)
var sharkSize = 2
var eatenFishCount = 0
var sharkLocation = (0, 0, time: 0)

// map 입력받기
for i in 0..<N {
    var line = readLine()!.split(separator: " ").map { Int(String($0))! }
    for block in line {
        if block != 0 && block != 9 {
            totalFish[block] = totalFish[block] + 1
        }
        if block == 9 {
            sharkLocation.0 = i
            sharkLocation.1 = line.firstIndex(of: block)!
            line[sharkLocation.1] = 0
        }
    }
    map[i] = line
}

let dx = [-1, 0, 0, 1] // 상, 좌, 우 하 순서
let dy = [0, -1, 1, 0]

func bfs() -> [(Int, Int, Int)] {
    var queue: [(Int, Int, time: Int)] = [sharkLocation]
    var head = 0
    var isVisited = Array(repeating: Array(repeating: false, count: N), count: N)
    
    var possibleFish: [(Int, Int, time: Int)] = []
    
    while queue.count > head {
        let cur = queue[head]
        head += 1
        
        for i in 0..<4 {
            let x = cur.0 + dx[i]
            let y = cur.1 + dy[i]
            
            // 예외 검사
            if x < 0 || y < 0 || x >= N || y >= N { continue }
            if isVisited[x][y] { continue }
            if map[x][y] > sharkSize { continue }
            
            // 방문처리
            isVisited[x][y] = true
            queue.append((x, y, time: cur.2 + 1))
            
            // 물고기 찾기
            if map[x][y] < sharkSize && map[x][y] != 0 {

                possibleFish.append((x, y, time: cur.2 + 1))
            }
        }
    }
    return possibleFish
}

// 먹을 수 있는 물고기가 안 남을 때 까지 while문 돌림
while true {
    
    var possibleFish = bfs()
    if possibleFish.isEmpty {
        print(timeSecond)
        break
    } else {
        // 잡은 게 있으면
        
        if possibleFish.count > 1 {
            // 잡은 것 중에 뭘 잡을지 고르자
            possibleFish = possibleFish.sorted { (fish1, fish2) -> Bool in
                
                if fish1.2 == fish2.2 {
                    if fish1.0 != fish2.0 {
                        return fish1.0 < fish2.0
                    } else {
                        return fish1.1 < fish2.1
                    }
                } else {
                    return fish1.2 < fish2.2
                }
            }
        }
        
        // 먹을 물고기
        let finalFish = possibleFish[0]
        timeSecond += finalFish.2
        
        totalFish[map[finalFish.0][finalFish.1]] -= 1 // 전체 물고기에서 뺌
        map[finalFish.0][finalFish.1] = 0 // 먹었으면 빈칸
        eatenFishCount += 1 // 먹은 물고기 마릿수 증가
        sharkLocation = (finalFish.0, finalFish.1, time: 0) // 상어 위치 조정
        if eatenFishCount == sharkSize {
            eatenFishCount = 0 // 다시 0으로 초기화
            sharkSize += 1 // 상어 크기 증가
        }
        
    }
}
