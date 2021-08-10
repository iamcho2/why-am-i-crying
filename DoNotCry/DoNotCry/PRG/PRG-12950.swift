//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/10.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var arr = [[Int]]()
    
    for i in 0..<arr1.count {
        var arrTemp: [Int] = []
        for k in 0..<arr1[i].count {
            
            arrTemp.append(arr1[i][k] + arr2[i][k] )
        }
        arr.append(arrTemp)
        
    }
    
    return arr
}

print(solution([[1,2],[2,3]], [[3,4],[5,6]]))
