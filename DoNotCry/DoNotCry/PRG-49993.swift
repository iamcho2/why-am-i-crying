//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/12/02.
//  PRG-49993

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var answer = 0
    var skill = skill.map { String($0) }
    
    var queue = [String]()
    checkSkillTrees: for sk in skill_trees {
        queue = sk.map { String($0) }
        var head = 0
        var skillTreeIdx = 0
        
        while head < queue.count {
            let cur = queue[head]
            head += 1
            
            // 현재 스킬이 스킬트리에 있는 스킬인지 확인
            if skill.contains(cur) {
                // 스킬 순서에 맞는지 확인
                if skill[skillTreeIdx] != cur {
                    continue checkSkillTrees
                } else {
                    // 스킬 순서에 맞는 스킬 발견
                    skillTreeIdx += 1
                }
            }
            
            // 스킬 트리 끝
            if skillTreeIdx == skill.count - 1 {
                break
            }
        }
        
        // 스킬 순서를 다 순서대로 충족하는 스킬트리였음
        answer += 1
    }
    
    return answer
}

print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
