//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/31.
//  BOJ-1643

import Foundation

while let N = readLine() {
    
    guard let N = Int(N) else { exit(0) }

    var son = 0 //분자
    var mom = 1 //분모

    // 1~N 의 최소공배수 구하기
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return a }
        else {
            return gcd(b, a%b)
        }
    }
    func lcm(_ a: Int, _ b: Int) -> Int {
        return a * b / gcd(a, b)
    }

    for i in 1...N {
        mom = lcm(mom, i)
    }

    // 분모를 맞춤에 따라 분자 총 합 계산
    for i in 1...N {
        son += mom / i
    }

    // 공식에 따라 분자에 N을 곱해줌
    son *= N

    // 기약분수 만들기
    /// 정수일 때
    if son % mom == 0 {
        print(son/mom)
    } else {
    /// 아닐 때
        // 정수부 분리
        var q = son/mom
        var newSon = son - q * mom
        
        // 분모 분자 나눠주기
        // 어차피 gcd 함수가 있으니까 이를 이용
        let gcd = gcd(newSon, mom)
        newSon = newSon / gcd
        mom = mom / gcd
        
        // 띄어쓰기 개수
        let spaceString = String(repeating: " ", count: String(q).count + 1)
        
        print(spaceString, newSon, separator: "")
        print(q, terminator: " ")
        
        // 작대기 길이
        let barCount = max(String(newSon).count, String(mom).count)
        let barString = String(repeating: "-", count: barCount)
        print(barString)
        
        print(spaceString, mom, separator: "")
    }
}
