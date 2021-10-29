//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/29.
//

import Foundation

var input = readLine()!.split(separator: " ").map { String($0) }

// comma, ; 삭제
for i in 1..<input.count-1 {
    input[i] = input[i].replacingOccurrences(of: ",", with: "")
}
input[input.count-1] = input[input.count-1].replacingOccurrences(of: ";", with: "")

// 자료형, 변수형 담을 배열
var answer = Array(repeating: input[0], count: input.count - 1)
// input 배열에서 공통 변수형 삭제
input.removeFirst()

// 각 input 검사
for i in 0..<input.count {
    
    while true {
        var suffix: String = String(input[i].suffix(1))
        if suffix == "*" || suffix == "&" {
            answer[i].append(contentsOf: suffix)
            input[i] = String(input[i].prefix(input[i].count - 1))
            continue
        }
        
        suffix = String(input[i].suffix(2))
        if suffix == "[]" {
            answer[i].append(contentsOf: suffix)
            input[i] = String(input[i].prefix(input[i].count - 2))
            continue
        }
        break
    }
    
}

for i in 0..<input.count {
    print(answer[i] + " " + input[i] + ";")
}
