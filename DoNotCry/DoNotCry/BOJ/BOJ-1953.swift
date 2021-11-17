//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/11/14.
//  BOJ-1953

import Foundation

let count = Int(readLine()!)!
var relationship = Array(repeating: [Int](), count: count+1)

for i in 1...count {
    var hates = readLine()!.split(separator: " ").map { Int(String($0))! }
    hates.removeFirst()
    relationship[i] = hates
}

var allTeam = Array(repeating: -1, count: count+1)
var teamA = [Int]() // 0
var teamB = [Int]() // 1

for i in 1...count {
    
    if allTeam[i] != -1 { continue }
    var head = 0
    var queue: [Int] = [i]
    // 지금까지 아무도 안 싫어해서 팀 배정을 안 받은 i는 임의로 팀A에 배정, 단 teamA는 사람 있는데 B가 비어있으면 B에 배정
    if !teamA.isEmpty && teamB.isEmpty {
        allTeam[i] = 1
        teamB.append(i)
    } else {
        allTeam[i] = 0
        teamA.append(i)
    }
    
    while queue.count > head {

        let cur = queue[head]
        head += 1
        
        for person in relationship[cur] {
            
            if allTeam[person] == -1 {
                queue.append(person)
                if allTeam[cur] == 0 {
                    allTeam[person] = 1
                    teamB.append(person)
                } else if allTeam[cur] == 1 {
                    allTeam[person] = 0
                    teamA.append(person)
                }
            }
            
        }
    }
}
print(teamA.count)
teamA.sort()
for i in teamA {
    print(i, terminator: " ")
}
print("")
print(teamB.count)
teamB.sort()
for i in teamB {
    print(i, terminator: " ")
}
print("")
