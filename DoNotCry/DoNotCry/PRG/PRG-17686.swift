//
//  PRG-17686.swift
//  DoNotCry
//
//  Created by 초이 on 2021/11/23.
//  PRG-17686

import Foundation

typealias Filename = (head: String, number: String, tail: String)

func solution(_ files:[String]) -> [String] {
    
    var fileNames: [Filename] = []
    
    for file in files {
        var fileName: Filename = ("", "", "")
        
        // find HEAD
        let firstNumberIdx = file.firstIndex(where: {$0.isNumber})!
        if file.startIndex < firstNumberIdx {
            fileName.head = String(file[file.startIndex..<firstNumberIdx])
        }
        
        // head를 뺀 string
        var leftStr = ""
        if firstNumberIdx < file.endIndex {
            leftStr = String(file[firstNumberIdx..<file.endIndex])
        }
        var tailIdx = leftStr.endIndex
        
        // number 찾기
        for i in 0..<leftStr.count {
            let idx = leftStr.index(leftStr.startIndex, offsetBy: i)
            if leftStr[idx].isNumber && i <= 4 {
                fileName.number.append(leftStr[idx])
            } else {
                tailIdx = idx
                break
            }
        }
        
        // tail 찾기
        if tailIdx < leftStr.endIndex {
            fileName.tail = String(leftStr[tailIdx..<leftStr.endIndex])
        }
        
        fileNames.append(fileName)
    }
    
    // 기준에 따라 정렬
    fileNames.sort { (file1, file2) -> Bool in
        
        // head 가 다를 경우
        if file1.head.lowercased() != file2.head.lowercased() {
            return file1.head.caseInsensitiveCompare(file2.head) == .orderedAscending
        } else {
        
        // head가 같을 경우 - number 비교
            return Int(file1.number)! < Int(file2.number)!
        }
    }
    
    // tuple을 string 배열로 변환 후 return
    var answer = [String]()
    for fileName in fileNames {
        let str = fileName.head + fileName.number + fileName.tail
        answer.append(str)
    }
    
    print(fileNames)
    return answer
}

print(solution(["F15", "Z11","O-11","ZK1"]))
