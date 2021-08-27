//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/27.
// BOJ-2504

import Foundation

var str: String = readLine()!
var arr: [Character] = Array(str)


func solution(str: String) -> Int {
    var answer = 0
    
    var st: [String] = [String(arr.removeFirst())]
    while !st.isEmpty {
        // 올바르지 않은 괄호문
        if arr.isEmpty {
            break
        }
        
        //
        st.append(String(arr.removeFirst()))
        
        if st.last == ")" {
            var idx = st.count - 2
            var temp = 0
            while st[idx] != "(" {
                if idx == 0 { return 0 }
                guard let num = Int(String(st[idx])) else { return 0 }
                temp += num
                idx -= 1
            }
            
            st.removeSubrange(idx...st.count-1)
            st.append( temp == 0 ? "2" : "\(2*temp)")
        } else if st.last == "]" {
            var idx = st.count - 2
            var temp = 0
            while st[idx] != "[" {
                if idx == 0 { return 0 }
                guard let num = Int(String(st[idx])) else { return 0 }
                temp += num
                idx -= 1
            }
            
            st.removeSubrange(idx...st.count-1)
            st.append( temp == 0 ? "3" : "\(3*temp)")
        }
        
    }

    for num in st {
        guard let num = Int(num) else { return 0 }
        answer += num
    }

    return answer
}

print(solution(str: str))
