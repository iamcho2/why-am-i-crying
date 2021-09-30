//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/09/30.
//  BOJ-12852

import Foundation

var num = Int(String(readLine()!))!
var D = Array(repeating: [0], count: num+4)
D[0] = []
D[1] = []
D[2] = [2]
D[3] = [3]
D[4] = [2, 4]

for i in 1...num {
    
    if i % 6 == 0 {
        
        if D[i/3].count > D[i/2].count {
            if D[i/2].count > D[i-1].count {
                D[i] = D[i-1] + [i]
            } else {
                D[i] = D[i/2] + [i]
            }
        } else {
            if D[i/3].count > D[i-1].count {
                D[i] = D[i-1] + [i]
            } else {
                D[i] = D[i/3] + [i]
            }
        }
        
    } else if i % 3 == 0 {
        
        if D[i/3].count > D[i-1].count {
            D[i] = D[i-1] + [i]
        } else {
            D[i] = D[i/3] + [i]
        }
        
    } else if i % 2 == 0 {
        
        if D[i/2].count > D[i-1].count {
            D[i] = D[i-1] + [i]
        } else {
            D[i] = D[i/2] + [i]
        }
        
    } else {
        D[i] = D[i-1] + [i]
    }
    
}

print(D[num].count-1)
for num in D[num].reversed() {
    print(num, terminator: " ")
}
