//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/08/06.
//

import Foundation

var str = "abcdefghijklmn.p"

func solution(_ new_id:String) -> String {
    str = new_id
    
    step1()
    step2()
    step3()
    step4()
    step5()
    step6()
    step7()
    
    return str
}

func step1() {
    str = str.lowercased()
}

func step2() {
    for ch in str {
        if !ch.isLetter && !ch.isNumber && ch != "-" && ch != "_" && ch != "." {
            str.remove(at: str.firstIndex(of: ch)!)
        }
    }
}

func step3() {
    while str.contains("..") {
        str = str.replacingOccurrences(of: "..", with: ".")
    }
}

func step4() {
    
    // 맨처음
    if !str.isEmpty && str[str.startIndex] == "." {
        str.removeFirst()
    }
    // 맨마지막
    if !str.isEmpty && str[str.index(before: str.endIndex)] == "." {
        str.removeLast()
    }
}

func step5() {
    if str.isEmpty {
        str = "a"
    }
}

func step6() {
    if str.count >= 16 {
        str = String(str[str.startIndex..<str.index(str.startIndex, offsetBy: 15)])
        step4()
    }
}

func step7() {
    if str.count <= 2 {
        let cnt = 3 - str.count
        str += String(repeating: str[str.index(before: str.endIndex)], count: cnt)
    }
}

print(solution(str))
