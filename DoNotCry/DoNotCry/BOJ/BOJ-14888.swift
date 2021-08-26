//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/27.
//

// BOJ-14888

import Foundation

let numCount = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{Int(String($0))!}
let oprs = readLine()!.split(separator: " ").map{Int(String($0))!}

var max = Int.min
var min = Int.max

var op: [Int] = []
for o in 0..<oprs.count {
    if oprs[o] == 0 { continue }
    for _ in 1...oprs[o] {
        op.append(o)
    }
}

var pm: [[Int]] = []
func permuteWirth(_ a: [Int], _ n: Int) {
    if n == 0 {
        pm.append(a)
    } else {
        var a = a
        permuteWirth(a, n - 1)
        for i in 0..<n {
            a.swapAt(i, n)
            permuteWirth(a, n - 1)
            a.swapAt(i, n)
        }
    }
}


// 순열 만들기
permuteWirth(op, op.count-1)

for ops in Set(pm) {
    
    var nums = nums
    var result = nums.removeFirst() // 처음 숫자 미리 대입
    
    for op in ops {
        switch op {
        case 0: // 더하기
            result += nums.removeFirst()
        case 1: // 빼기
            result -= nums.removeFirst()
        case 2: // 곱하기
            result *= nums.removeFirst()
        case 3: // 나누기
            result /= nums.removeFirst()
        default:
            break
        }
    }
    
    // 최대, 최소 점검
    if result > max {
        max = result
    }
    if result < min {
        min = result
    }
}

print(max)
print(min)
