//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/12/02.
//  PRG-17684

import Foundation

typealias Dict = [String: Int]

func solution(_ msg:String) -> [Int] {
    
    var msg = msg
    
    // 사전 초기화
    var dicts: Dict = [:]
    for asciiNum in stride(from: 65, to: 91, by: 1) {
        dicts[String(UnicodeScalar(UInt8(asciiNum)))] = asciiNum-64
    }
    
    // 답 배열
    var answer = [Int]()
    
    // 2~5단계 함수 만들기
    func getIndex(str: inout String) {
        var wIdx = 0
        var curStr = ""
        // 사전에서 현재 입력과 일치하는 가장 긴 문자열 w를 찾는다.
        for strCount in 1...str.count {
            let endIndex = str.index(str.startIndex, offsetBy: strCount)
            let newStr = String(str[str.startIndex..<endIndex])
            
            guard let newIdx = dicts[newStr] else {
                break
            }
            wIdx = newIdx
            curStr = newStr
        }
        
        // w에 해당하는 사전의 색인 번호를 출력
        answer.append(wIdx)
        
        // 입력에서 w 제거
        let startIdx = str.index(str.startIndex, offsetBy: curStr.count)
        str = String(str[startIdx..<str.endIndex])
        
        // 입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
        if !str.isEmpty {
            let newStr = curStr + String(str[str.startIndex])
            dicts[newStr] = dicts.count + 1
        }
    }
    
    while !msg.isEmpty {
        getIndex(str: &msg)
    }
    
    return answer
}

print(solution("KAKAO"))
print(solution("TOBEORNOTTOBEORTOBEORNOT"))
print(solution("ABABABABABABABAB"))
