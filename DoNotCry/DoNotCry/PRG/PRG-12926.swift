//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/19.
//

import Foundation

func solution(_ s:String, _ n:Int) -> String {
    
    var answer: String = ""
    for ch in s {
        var num = Int(ch.asciiValue!)
        
            if (65...90).contains(num) {
                // n을 더하면 대문자 범위 벗어날 때
                if num + n > 90 {
                    num = num - 26 + n
                } else {
                    num += n
                }
            } else if (97...122).contains(num) {
                // n을 더하면 소문자 범위 벗어날 때
                if num + n > 122 {
                    num = num - 26 + n
                } else {
                    num += n
                }
            } // 공백일 경우 자동으로 계산 안 됨
        
        answer += String(UnicodeScalar(UInt8(num)))
    }
    
    return answer
}

print(solution("ABcz", 1))
