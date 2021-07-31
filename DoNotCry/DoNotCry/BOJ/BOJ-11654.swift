//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { String($0) }
let asciiNum = Character(input[0]).asciiValue!
print(asciiNum)
