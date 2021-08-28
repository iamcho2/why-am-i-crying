//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/28.
// BOJ-14719

import Foundation

var input0: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var nums: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

// 2차원 배열 만들기
// 맨 밑 줄 부터
var arr: [[Int]] = []
var temp: [Int] = []

for _ in 0..<input0[0] {
    for idx in 0..<nums.count {
        if nums[idx] > 0 {
            nums[idx] -= 1
            temp.append(1)
        } else {
            temp.append(0)
        }
    }
    arr.append(temp)
    temp.removeAll()
}

var answer = 0

// 한줄씩 1이 다시 1을 만날때까지 0의 개수 세기
for line in arr { // line = [1, 0, 1, 1]
    var temp = 0 // 각 줄에서 1과 1 사이 0의 개수
    
    if !line.contains(1) { break } // 한 줄에 1이 없으면 그 다음부터 다 line 검사 필요 없음
    
    let firstIndex = line.firstIndex(of: 1)!
    let lastIndex = line.lastIndex(of: 1)!
    
    if firstIndex == lastIndex { // 한 line에 1이 1개뿐 (짝이 없음)
        break
    } else {
        
        var idx = firstIndex + 1
        while idx < lastIndex {
            if line[idx] == 0 { temp += 1 }
            idx += 1
        }
    }
    
    answer += temp
    temp = 0
}

print(answer)
