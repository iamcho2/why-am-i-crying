// BOJ-1759 암호 만들기
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

// 전역 변수 선언
int L = 0, C = 0;
vector<char> v; // 전체 C 벡터
vector<char> answer; // 답 벡터

// 백트래킹 함수
void back_tracking(vector<char> v, int moeum, int jaeum, int cur){
    // 답을 찾았을 때
    if (answer.size() == L && moeum >= 1 && jaeum >= 2){
        for(int i = 0; i < answer.size(); i++){ // 전체 answer 출력
            cout << answer[i];
        }
        cout << endl;
        return;
    }

    // 전체 C 내 for문
    for (int i = cur; i < C; i ++){
        // 문자가 모음일 때
        if (v[i] == 'a' || v[i] == 'e' || v[i] == 'i' || v[i] == 'o' || v[i] == 'u' ){
            answer.push_back(v[i]);
            back_tracking(v, moeum + 1, jaeum, i + 1);
            answer.pop_back();
        } else {
            // 문자가 자음일 때
            answer.push_back(v[i]);
            back_tracking(v, moeum, jaeum + 1, i + 1);
            answer.pop_back();
        }
    }
}

int main() {
    cin >> L >> C;
    for(int i = 0; i < C; i++ ){
        char t = 'a';
        cin >> t;
        v.push_back(t);
    }
    sort(v.begin(), v.end());
    
    back_tracking(v, 0, 0, 0);
}