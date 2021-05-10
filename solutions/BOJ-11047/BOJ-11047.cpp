// BOJ-11047 동전 0
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    int n = 0, k = 0;
    int answer = 0;
    vector<int> v;

    cin >> n >> k;

    for(int i = 0; i < n; i++){
        int coin = 0;
        cin >> coin;
        v.push_back(coin);
    }

    // 벡터 내림차순 정렬
    sort(v.begin(), v.end(), greater<int>());

    for(int i=0; i<v.size(); i++){
        if (k / v[i] != 0) {
            answer += k / v[i];
            k %= v[i];
        }
    }

    cout << answer;
}