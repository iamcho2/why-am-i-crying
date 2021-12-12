//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/12/12.
//  BOJ-11399

import Foundation

let N = Int(readLine()!)!
var P = readLine()!.split(separator: " ").map { Int(String($0))! }

P.sort()

var n = N+1
P = P.map {
    n -= 1
    return $0 * n }

print(P.reduce(0, +))
