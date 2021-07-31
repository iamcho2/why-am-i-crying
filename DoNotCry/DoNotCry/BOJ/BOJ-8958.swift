//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/01.
// 8958

import Foundation

let testNum = readLine()!.split(separator: " ").map { Int($0)! }

for _ in 1...testNum[0] {
    
    let result = readLine()!.split(separator: " ").map {String($0)}
    var score = 0
    var totalScore = 0
    
    for ch in result[0] {
        if ch == "O" {
            score += 1
            totalScore += score
        } else if ch == "X" {
            score = 0
        }
    }
    
    print(totalScore)
    
}
