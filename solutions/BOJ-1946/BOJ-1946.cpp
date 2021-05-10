// BOJ-1946 신입 사원
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

struct pair<int, int> Score;

int main() {
    cin.tie(NULL); cout.tie(NULL);
    ios_base::sync_with_stdio(false);
    
    // 테스트 케이스 수
    int testCase = 0;
    cin >> testCase;

    // 테스트 케이스 수 만큼 반복
    for (int i=0; i<testCase; i++){
        int answer = 0, person = 0, best = 0;
        vector<pair<int, int> > v;
        
        // 사원 수 입력
        cin >> person;
        // 사원들 점수 입력
        for(int k=0; k<person; k++){
            pair<int, int> s;
            cin >> s.first >> s.second;

            // best 점수가 있을 시 그 후로는 바로 검사
            if (best != 0){
                if(s.second < best){
                    v.push_back(s);
                }
            }else {
                // best 점수가 없으면 그냥 push
                v.push_back(s);
            }

            // 1차에서 1등의 2차 점수 저장
            if (s.first == 1){
                best = s.second;
            }
        }

        // 1차 시험 등수 기준으로 벡터 정렬
        sort(v.begin(), v.end());
        answer++; //1차 시험 1등

        int min = v[0].second;

        for(int k=1; k<v.size(); k++){
            
            if (v[k].second < min){
                min = v[k].second;
                answer++;
            } 

            if (v[k].second == 1){
                break;
            }
        }

        // 정답 출력
        cout << answer << endl;
    }
}