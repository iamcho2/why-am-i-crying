//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/14.
// BOJ-1246

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (N, M) = (input[0], input[1])
var price: [Int] = []
for _ in 0..<M {
    price.append(Int(String(readLine()!))!)
}

price.sort()

var max = Int.min
var count = 0
var eggPrice = 0
var income = 0

for i in 0..<M {
    if M-i < N {
        income = price[i] * (M-i)
    } else {
        income = price[i] * N
    }
    
    if max < income {
        eggPrice = price[i]
        max = income
    }
}

print(eggPrice, max, terminator: " ")
