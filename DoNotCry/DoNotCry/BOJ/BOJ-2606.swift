//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/14.
// BOJ-2606

import Foundation

var comCount: Int = Int(String(readLine()!))!
var pairCount: Int = Int(String(readLine()!))!
var graph: [[Int]] = Array(repeating: [], count: 110)

for _ in 0..<pairCount {
    let arr: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[arr[0]].append(arr[1])
    graph[arr[1]].append(arr[0])
}

var isUsed: [Bool] = Array(repeating: false, count: 110)
var answer = 0

func addVirus(num: Int) {
    answer += 1
    isUsed[num] = true
    
    for i in 0..<graph[num].count {
        let next = graph[num][i]
        
        if !isUsed[next] {
            addVirus(num: next)
        }
    }
}

addVirus(num: 1)
print(answer-1)
