//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/12.
// BOJ-14889

import Foundation

let n = Int(String(readLine()!))!
var arr: [[Int]] = []
var isUsed = Array(repeating: false, count: n)
var totalScore = 0

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(row)
    for item in row { totalScore += item }
}

var ans = Int.max
var score1 = 0
var score2 = 0

func addPerson(curPlayer: Int, num: Int) {
    
    // base condition
    if num == n / 2 {
        var linkTeam: [Int] = []
        var startTeam: [Int] = []
        
        // 팀에 사람 배치
        for i in 0..<n {
            if isUsed[i] {
                startTeam.append(i)
            } else {
                linkTeam.append(i)
            }
        }
        
        score1 = 0
        score2 = 0
        for i in 0..<startTeam.count {
            for j in i+1..<startTeam.count {
                let startX = startTeam[i]
                let startY = startTeam[j]
                let linkX = linkTeam[i]
                let linkY = linkTeam[j]
                
                score1 += arr[startX][startY] + arr[startY][startX]
                score2 += arr[linkX][linkY] + arr[linkY][linkX]
            }
        }
        
        ans = min(ans, abs(score1-score2))
    }
    
    for i in curPlayer+1..<n {
        if !isUsed[i] {
            isUsed[i] = true
            addPerson(curPlayer: i, num: num+1)
            isUsed[i] = false
        }
    }
}

addPerson(curPlayer: 0, num: 0)
print(ans)
