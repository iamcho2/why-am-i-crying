//
//  main.swift
//  DoNotCry
//
//  Created by 초이 on 2021/10/04.
//  BOJ-1926-two-stack-queue

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1]) //N행 M열
var board = Array(repeating: Array(repeating: 0, count: M+2), count: N+2)
var vis = Array(repeating: Array(repeating: false, count: M+2), count: N+2)
for i in 0..<N {
    board[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

// 두 스택 만들기
var leftStack: [[Int]] = []
var rightStack: [[Int]] = []

// 답 변수들
var paintCount = 0
var maxArea = 0
var tempArea = 0

// two stack queue 사용한 queue의 dequeue 함수 생성
@discardableResult
func dequeue() -> [Int] {
    if leftStack.isEmpty {
        leftStack = rightStack.reversed()
        rightStack.removeAll()
    }
    return leftStack.popLast()!
}

// bfs 재귀함수
func bfs() {
    // while문 1번 당 1개의 그림 찾음
    // 두 stack이 비어있을 때 while문 종료
    while !leftStack.isEmpty || !rightStack.isEmpty {
        tempArea += 1
        let current = dequeue()
        let (x, y) = (current[0], current[1]) // x행 y열
        for i in 0..<4 {
            let curX = x + dx[i]
            let curY = y + dy[i]
            // 범위 검사
            if curX < 0 || curX >= N || curY < 0 || curY >= M { continue }
            // 방문, 유효 칸 검사
            if vis[curX][curY] || board[curX][curY] == 0 { continue }
            // 방문체크, queue에 append
            vis[curX][curY] = true
            rightStack.append([curX, curY])
        }
    }
    paintCount += 1
    maxArea = max(maxArea, tempArea)
}

for x in 0..<N {
    for y in 0..<M {
        if board[x][y] == 1 && !vis[x][y] {
            // 새로운 시작점 찾을 때 마다 두 stack 초기화
            leftStack.removeAll()
            rightStack.removeAll()
            // 그림의 넓이 변수 초기화
            tempArea = 0
            // 방문, append
            vis[x][y] = true
            rightStack.append([x, y])
            // [x,y]가 시작점인 그림 dfs
            bfs()
        }
    }
}

print(paintCount)
print(maxArea)
