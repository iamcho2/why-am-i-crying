//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/26.
//

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    
    let req = d.sorted()
    var money = 0
    var answer = 0
    
    for d in req {
        money += d
        answer += 1
        if money > budget {
            return answer - 1
        } else if money == budget {
            return answer
        }
    }
    
    return d.count
}

print(solution([2,2,3,3], 10))
