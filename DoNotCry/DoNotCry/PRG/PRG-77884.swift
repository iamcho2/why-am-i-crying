//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/26.
//

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    
    var answer = 0
    
    for num in left...right {
        
        print(getDivisorCount(num: num))
        
        if getDivisorCount(num: num) % 2 == 0 {
            answer += num
        } else {
            answer -= num
        }
    }
    
    return answer
}

func getDivisorCount(num: Int) -> Int {
    var count = 0
    
    let half = num / 2 >= 1 ? num / 2 : 1
    for i in 1...half {
        if num % i == 0 {
            count += 1
        }
    }
    
    return num > 1 ? count+1 : count
}

print(solution(1, 2))
