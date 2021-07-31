//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/01.
//

import Foundation

var testNum = readLine()!.split(separator: " ").map { Int($0)! }

for _ in 1...testNum[0] {
    
    let testcase = readLine()!.split(separator: " ").map { String($0) }
    let repeatNum = Int(testcase[0])!
    let repeatString = testcase[1]
    
    for i in repeatString.indices {
        for _ in 1...repeatNum {
            print(repeatString[i], terminator: "")
        }
    }
    print("")
}
