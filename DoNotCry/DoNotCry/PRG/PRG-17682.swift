//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/24.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    var totalScore: Int = 0
    var score: [Int] = []
    
    for i in 0..<dartResult.count {
        let idx = dartResult.index(dartResult.startIndex, offsetBy: i)
        if dartResult[idx].isNumber {
            if dartResult[idx] == "0" {
                
                if score.count > 0 {
                    if score[score.count - 1] == 1 {
                        score[score.count - 1] = 10
                    } else {
                        score.append(0)
                    }
                } else {
                    score.append(0)
                }
            } else {
                score.append(Int(String(dartResult[idx]))!)
            }
            
            print(score)
        } else {
            // 옵션 #
            if dartResult[idx] == "#" {
                score[score.count-1] = -score[score.count-1]
                
            // 옵션 *
            } else if dartResult[idx] == "*" {
                if(score.count > 1) {
                    score[score.count-2] *= 2
                }
                score[score.count-1] *= 2
                
            // 보너스
            } else {
                score[score.count-1] = getBonus(score[score.count-1], dartResult[idx])
            }
        }
    }
    totalScore = score.reduce(0, +)
    
    return totalScore
}

func getBonus(_ num: Int,_ bonus: Character) -> Int {
    switch bonus {
        case "S":
        return num
        case "D":
        return num*num
        case "T":
        return num*num*num
        default:
        return 0
    }
}

print(solution("10T10S*10S"))
