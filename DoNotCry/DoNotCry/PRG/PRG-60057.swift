//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/11/17.
//

import Foundation

func solution(_ s:String) -> Int {
    var splitedString = [(String, Int)]()
    var answerCount = Array(repeating: Int.max, count: s.count / 2 + 1)
    
    // 1글자 짜리일 때 예외처리
    if s.count == 1 { return 1 }
    
     for i in 1..<s.count / 2 + 1 {
        splitedString = []
        var remainPart = s
        var prevPrefix = ""
        var prefix = ""
        var tempTuple: (str: String, count: Int) = ("", 0)
        
        while true {
            
            // 남은 부분에 대한 prefix 계속 만들기
            prevPrefix = String(prefix) // 전 prefix 저장
            prefix = String(remainPart.prefix(i))
            
            // 전 prefix랑 일치하면 숫자 증가시키고, 없으면 새로 튜플 만들기
            if prefix == prevPrefix {
                tempTuple.str = prevPrefix
                tempTuple.count += 1
            } else {
                splitedString.append(tempTuple)
                tempTuple.str = prefix
                tempTuple.count = 1
            }
            
            // 다음 remainPart 만들기
            let startIndex = remainPart.index(remainPart.startIndex, offsetBy: i)
            let endIndex = remainPart.index(remainPart.endIndex, offsetBy: -1)
            if startIndex <= endIndex {
                remainPart = String(remainPart[startIndex...endIndex])
                // remainPart 길이가 0이거나 그거보다 적게 남았으면 break
                if remainPart.isEmpty || remainPart.count < i {
                    splitedString.append(tempTuple)
                    splitedString.append((remainPart, 1))
                    break
                }
            } else {
                splitedString.append(tempTuple)
                break
            }
        }
        
        
        // 글자수 계산
        var strCount = 0
        for substr in splitedString {
            strCount += substr.0.count
            if substr.1 != 1 {
                strCount += String(substr.1).count
            }
        }
        answerCount[i] = strCount - 1 // ("", 0)이거 제외
    }
    
    return answerCount.min()!
}

let str = String(readLine()!)
print(solution(str))
