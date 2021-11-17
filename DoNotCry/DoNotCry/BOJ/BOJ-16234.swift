//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/11/14.
//

import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, L, R) = (input[0], input[1], input[2])

var population = Array(repeating: [Int](), count: N)
for i in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    population[i] = line
}

var day = 0
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

while true {
    
    var unions = [[[Int]]]()
    var isVisited = Array(repeating: Array(repeating: false, count: N), count: N)
    
    for x in 0..<N {
        for y in 0..<N {
            
            if isVisited[x][y] { continue }
            var head = 0
            var queue = [[Int]]()
            queue.append([x, y])
            isVisited[x][y] = true
            
            while queue.count > head {
                
                let cur = queue[head]
                head += 1
                
                for i in 0..<4 {
                    
                    let newX = cur[0] + dx[i]
                    let newY = cur[1] + dy[i]
                    
                    if newX >= 0 && newY >= 0 && newX < N && newY < N {
                        if isVisited[newX][newY] { continue }
                        let tempDiff = abs(population[cur[0]][cur[1]] - population[newX][newY])
                        if tempDiff >= L && tempDiff <= R {
                            queue.append([newX, newY])
                            isVisited[newX][newY] = true
                        }
                    }
                }
            }
            unions.append(queue)
        }
    }
    
    if unions.count == N * N {
        break
    }
    
    day += 1
    
    for union in unions {
        var popSum = 0
        if union.count == 1 { continue }
        for i in union {
            popSum += population[i[0]][i[1]]
        }
        for i in union {
            population[i[0]][i[1]] = popSum / union.count
        }
    }
}

print(day)
