//
//  BOJ-15651.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/03.
//

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
var result = ""

func makePm(_ num: Int) {
    
    // base condition
    if num == input[1] {
        print(result)
        return
    }
    
    for i in 1...input[0] {
        if num == 0 {result.write(String(i))} else {result.write(" " + String(i))}
        makePm(num + 1)
        result.popLast()!
        if num != 0 {result.popLast()!}
    }
}

makePm(0)
