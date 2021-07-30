//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/07/29.
//

import Foundation

var input = readLine()

if let input = input {
    let inputs = input.components(separatedBy: " ")
    
    let numA = Double(inputs[0])!
    let numB = Double(inputs[1])!
    
    print(numA / numB)
}
