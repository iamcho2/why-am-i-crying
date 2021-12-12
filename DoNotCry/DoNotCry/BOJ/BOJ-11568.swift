//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/12/12.
//  BOJ-11568

import Foundation

let N = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int(String($0))! }
var lis = [Int]()

func binarySearch(arr: [Int], num: Int) -> Int {
    var left = 0
    var right = arr.count-1
    var mid = 0
    
    while left < right {
        mid = (left + right) / 2
        if num <= arr[mid] {
            right = mid
        } else {
            left = mid + 1
        }
    }
    return left
}

for i in 0..<N {
    if lis.isEmpty {
        lis.append(cards[i])
    } else if lis.last! < cards[i] {
        lis.append(cards[i])
    } else if lis.last! > cards[i] {
        // binary search해서 교체
        lis[binarySearch(arr: lis, num: cards[i])] = cards[i]
    }
}

print(lis.count)
