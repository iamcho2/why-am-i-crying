// BOJ-1182 부분수열의 합
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
// 전역 변수
int answer = 0;
int n = 0, s = 0;

// 부분수열 함수
vector<int> getCombination(int elementNum) {
    // 조합 벡터 만들기
    vector<int> comb;
    // 우선 combinaction 원소 개수 N개로 (0) 맞추기
    for(int i=0; i<n; i++){
        comb.push_back(0);
    }
    // elementNum 개수만큼 앞에서부터 1로 바꾸기
    for(int i=0; i < elementNum; i++){
        comb[i] = 1; //이렇게 해도 되나? 안되면 먼저 1 채우고 나머지 개수만큼 0 채우기
    }

    sort(comb.begin(), comb.end());

    return comb;
}

int main() {
    // 입력
    cin >> n >> s;

    vector<int> v;
    for(int i = 0; i < n; i++){
        int t = 0;
        cin >> t;
        v.push_back(t);
    }

    // 원소 수 기반 combination vector 얻기
    for(int i = 1; i <= n; i++){
        vector<int> combination = getCombination(i);

        do {

            int sum = 0;
            for(int j = 0; j < combination.size(); j++){
                if(combination[j] == 1){
                    sum += v[j];
                }
            }

            // 정답일 때
            if(sum == s){
                answer++;
            }
        } while (next_permutation(combination.begin(), combination.end()));
        
    }

    cout << answer;


    return 0;
}