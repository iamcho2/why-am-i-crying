//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/12/02.
//  BOJ-20040

import Foundation
typealias Line = (Int, Int)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
var answer = 0

// 배열 초기화
var lines: [Int] = Array(0...n)

// 최상위 부모 노드 찾아서 반환
func findParent(num: Int) -> Int {
    // 자기 자신이 최상위 부모면 return
    if lines[num] == num {
        return num
    } else {
        lines[num] = findParent(num: lines[num])
        return lines[num]
    }
}

// 부모 노드 합치기
func unionParent(a: Int, b: Int) {
    let par1 = findParent(num: a)
    let par2 = findParent(num: b)
    
    if par1 < par2 {
        lines[par2] = lines[par1]
    } else {
        lines[par1] = lines[par2]
    }
}

// line 입력받기
for i in 0..<m {
    let newInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    let newLine: Line = (newInput[0], newInput[1])
    
    if findParent(num: newLine.0) == findParent(num: newLine.1) {
        answer = i + 1
        break
    }
    unionParent(a: newLine.0, b: newLine.1)
}

print(answer)
