//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/12/12.
//  PRG-17679

import Foundation

struct Point: Hashable {
    let x: Int
    let y: Int
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    var boomCount = 0
    
    var map = [[String]]()
    for b in board {
        map.append(b.map { String($0) })
    }
    
    let dx = [1, 0, 1]
    let dy = [0, 1, 1]
    
    func findBoom() -> [Point] {
        var boom = [Point]()
        for x in 0..<map.count {
            for y in 0..<map[0].count {
                let character = map[x][y]
                
                var isStartPointOfBlock = true
                for i in 0..<3 {
                    
                    let x = x + dx[i]
                    let y = y + dy[i]
                    
                    // 범위검사
                    if x < 0 || x >= m || y < 0 || y >= n { isStartPointOfBlock = false; continue }
                    if map[x][y] == "" { isStartPointOfBlock = false }
                    
                    // 위, 오른쪽, 오른쪽위대각선이 같은 캐릭터인지
                    if map[x][y] != character {
                        isStartPointOfBlock = false
                    }
                }
                // block 찾았다면 터트리기
                if isStartPointOfBlock {
                    boom.append(Point(x: x, y: y))
                    for i in 0..<3 {
                        let x = x + dx[i]
                        let y = y + dy[i]
                        
                        boom.append(Point(x: x, y: y))
                    }
                }
            }
        }
        return boom
    }
    
    func refreshMap() {
        // 세로줄 순회
        for i in 0..<map[0].count {
            var col = map.compactMap { $0[i] }
            if col.contains("") {
                col = col.filter { $0 != "" }
                col = Array(repeating: "", count: map.count - col.count) + col
            }
            for j in 0..<col.count {
                map[j][i] = col[j]
            }
        }
    }
    
    while true {
        
        let boom = findBoom()
        
        // 탈출 조건문
        if boom.isEmpty { break }
        
        // 터트리기
        for b in boom {
            map[b.x][b.y] = ""
        }
        boomCount += Set(boom).count
        
        // 내릴거 내리기
        refreshMap()
    }
    
    return boomCount
}

print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]))
print(solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]))
