//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/04.
// BOJ-9663

import Foundation

let n = Int(String(readLine()!))!
var queens: [[Int]] = Array(repeating: [], count: 20)
var answerCount = 0

var allQueenOK: Bool = true
var cols: [Int] = Array(repeating: 0, count: 20)

func putQueen(row: Int) {
    // base condition
    if row == n {
        answerCount += 1
        return
    }
    
    for col in 0..<n {
        // 이미 놓여진 말들에 따라, 지금 말을 놓을 수 있는지 검사
        
        if queens[0] == [] {
            allQueenOK = true
        } else {
            allQueenOK = true
            
            // 세로줄
            if cols[col] > 0 {
                allQueenOK = false
            } else {
                for queen in queens {
                    if queen != [] {
                        
                        // 대각선
                        if row+col == queen[0] + queen[1] { allQueenOK = false; continue }
                        if row-col == queen[0] - queen[1] { allQueenOK = false; continue }
                        
                    }
                }
            }
        }
        if allQueenOK {
            // 다 통과하면 지금 퀸 놓고, 다음 퀸 놓으러 가기
            queens[row] = [row, col]
            cols[col] += 1
            putQueen(row: row + 1)
            queens[row] = []
            cols[col] -= 1
        }
    }
}

putQueen(row: 0)
print(answerCount)
