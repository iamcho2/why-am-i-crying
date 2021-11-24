//
//  PRG-42890.swift
//  DoNotCry
//
//  Created by 초이 on 2021/11/24.
// PRG-42890

import Foundation

func solution(_ relation:[[String]]) -> Int {
    
    // function: 해당 조합이 후보키가 될 수 있는지 검사
    func isCandidateKey(_ canIdx: [Int]) -> Bool {
        // 해당 att만 세로로 뽑아온 배열
        var selectedAttArr = [[String]]()
        for row in relation {
            var selectedRowArr = [String]()
            for j in canIdx {
                selectedRowArr.append(row[j])
            }
            selectedAttArr.append(selectedRowArr)
        }
        
        // set이랑 arr랑 비교해서 후보키가 될 수 있는지 검사
        if Set(selectedAttArr).count == selectedAttArr.count {
            return true
        } else {
            return false
        }
    }
    
    let colCount = relation[0].count
    
    // 모든 조합 뽑기
    var allCombi = [[Int]]()
    for i in 1...colCount {
        let newCombi = combi(Array(0..<colCount), i)
        allCombi.append(contentsOf: newCombi)
    }
    
    // 검사하면서 후보키가 된다면 그 이후로는 자신을 포함한 조합을 검사하지 않도록 allCombi에 반영
    
    var idx = 0
    while idx < allCombi.count {
        
        if isCandidateKey(allCombi[idx]) {
            // 자신 빼고, 그 다음부터 자신을 포함한 조합 다 지우기
            var newAllCombi = Array(allCombi[0...idx])
            for i in idx+1..<allCombi.count {
                if !Set(allCombi[idx]).isSubset(of: Set(allCombi[i])) {
                    newAllCombi.append(allCombi[i])
                }
            }
            allCombi = newAllCombi
            
            // 다음 idx 검사
            idx += 1
        } else {
            allCombi.remove(at: idx)
        }
    }
    
    return allCombi.count
}

func combi(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func combination(_ index: Int, _ nowCombi: [Int]) {
        if nowCombi.count == targetNum {
            result.append(nowCombi)
            return
        }
        for i in index..<nums.count {
            combination(i + 1, nowCombi + [nums[i]])
        }
    }
    
    combination(0, [])
    
    return result
}

print(solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]))
