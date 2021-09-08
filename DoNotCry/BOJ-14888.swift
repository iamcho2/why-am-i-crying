//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/09.
//  BOJ-14888

import Foundation

var numCount = Int(String(readLine()!))!
var nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var ops = readLine()!.split(separator: " ").map { Int(String($0))! }

var min = Int.max
var max = Int.min

func calculate(current: Int, idx: Int) {
    
    // base condition
    if ops.reduce(0, +) == 0 {
        if current < min  { min = current }
        if current > max { max = current }
        return
    }
    
    for i in 0..<ops.count {
        if ops[i] != 0 {
            ops[i] -= 1
            switch i {
            case 0:
                calculate(current: current+nums[idx], idx: idx + 1)
            case 1:
                calculate(current: current-nums[idx], idx: idx + 1)
            case 2:
                calculate(current: current*nums[idx], idx: idx + 1)
            case 3:
                calculate(current: current/nums[idx], idx: idx + 1)
            default:
                break
            }
            ops[i] += 1
        }
    }
}

calculate(current: nums[0], idx: 1)
print(max)
print(min)
