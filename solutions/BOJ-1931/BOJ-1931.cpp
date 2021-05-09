// BOJ-1931 회의실 배정
#include <iostream>
#include <algorithm>
#include <vector>
#include <queue>

using namespace std;

typedef struct Meeting {
    int start;
    int end;
}Meeting;

// compare 함수
struct cmp {
    bool operator()(Meeting &a, Meeting &b) {
        if(a.end == b.end){
            return a.start > b.start;
        }
        else return a.end > b.end;
    }
};


int main() {
    int count, answer = 0;
    cin >> count;
    vector<Meeting> v;

    for(int i=0; i<count; i++){
        Meeting m;
        cin >> m.start >> m.end;
        
        v.push_back(m);
    }

    // 끝나는 시간이 가장 빠른 순서대로 정렬
    priority_queue<Meeting, vector<Meeting>, cmp> pq;
    for (int i=0; i<v.size(); i++) {
        pq.push(v[i]);
    }

    // 제일 일찍 끝나는 회의 뽑기
    int tempEnd = 0;

    // 그 후로 제일 일찍 끝나는 회의 뽑기
    while(!pq.empty()){
        // 다음 회의 시작시간이 tempEnd보다 작으면 pop
        if(pq.top().start < tempEnd) {
            pq.pop();
        } else {
            tempEnd = pq.top().end;
            pq.pop();
            answer++;
        }
    }

    cout << answer;
}