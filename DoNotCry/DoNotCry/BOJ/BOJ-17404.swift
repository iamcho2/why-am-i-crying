//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/29.
//  BOJ-17404

import Foundation

let houseCount = Int(String(readLine()!))!
var price = Array(repeating: [0, 0, 0], count: houseCount)

for i in 0..<houseCount {
    let housePrice = readLine()!.split(separator: " ").map { Int(String($0))! }
    price[i] = housePrice
}

// table
var D = Array(repeating: [0, 0, 0], count: houseCount)

var answer = Int.max
var arr = [0, 0, 0]

func getMinCostAt(firstColor: Int) -> Int {
    
    for i in 2..<houseCount {
        D[i][0] = min(D[i-1][1], D[i-1][2]) + price[i][0]
        D[i][1] = min(D[i-1][0], D[i-1][2]) + price[i][1]
        D[i][2] = min(D[i-1][0], D[i-1][1]) + price[i][2]
    }
    
    D[houseCount-1][firstColor] = Int.max
    return min(answer, D[houseCount-1].min()!)
}

// 초깃값이 0일때
D[1][0] = Int.max; D[1][1] = price[0][0] + price[1][1]; D[1][2] = price[0][0] + price[1][2]
arr[0] = getMinCostAt(firstColor: 0)

// 초깃값이 1일때
D[1][0] = price[0][1] + price[1][0]; D[1][1] = Int.max; D[1][2] = price[0][1] + price[1][2]
arr[1] = getMinCostAt(firstColor: 1)

// 초깃값이 2일때
D[1][0] = price[0][2] + price[1][0]; D[1][1] = price[0][2] + price[1][1]; D[1][2] = Int.max
arr[2] = getMinCostAt(firstColor: 2)

print(arr.min()!)
