//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/22.
//  BOJ-10844

import Foundation

let count = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: 101)

dp[1] = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]

if count > 1 {
    
    // 자릿수
    for i in 2...count {
        
        for j in 0..<10 {
            
            switch j {
            case 0:
                                // j+1인 1에서만 0이 올 수 있다.
                dp[i][j] = dp[i-1][j+1] % 1000000000
            case 9:
                                // j-1인 8에서만 9가 올 수 있다.
                dp[i][j] = dp[i-1][j-1] % 1000000000
            default:
                dp[i][j] = dp[i-1][j-1] + dp[i-1][j+1] % 1000000000
            }
            
        }
    }
    
}

print( dp[count].reduce(0, +) % 1000000000 )
