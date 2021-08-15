//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/15.
//

import Foundation

func solution(_ n:Int) -> Int {
    
    var prime: [Int] = []
    var num = n
    
    var tempArr = Array(2...n)
    
    while tempArr.count != 0 {
        prime.append(tempArr[0])
        tempArr = tempArr.filter { $0 % tempArr[0] != 0 }
    }
    print(prime)
    return prime.count
}

print(solution(100000))
