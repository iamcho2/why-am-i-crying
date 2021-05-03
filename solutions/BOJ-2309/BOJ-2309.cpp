// BOJ-2309 일곱 난쟁이
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int main() {
    // 변수 선언
    vector<int> v;
    int sum = 0, first = 0, second = 0;
    int t = 0; // 벡터에 값을 삽입하기 위한 임시 변수

    // 입력받기
   for (int i = 0; i < 9; i++){
       cin >> t;
       sum += t;
       v.push_back(t);
   }

    // first, second 찾기
   for (int i = 0; i <= 7; i++){
        for (int j = i+1; j <= 8; j++) {
            int tempSum = sum;
            tempSum = tempSum - v[i] - v[j];
            if (tempSum == 100){
                first = i;
                second = j;
                break;
            }
        }
        // i, j 찾으면 한번 더 break!
        if (first != 0 && second != 0) {
            break;
        }
   }

    // first, second 지우고 정렬
    v.erase(v.begin() + first); // first 원소 삭제
    second -= 1;
    v.erase(v.begin() + second); // first가 삭제된 후이므로 index 1 줄여서 삭제
    sort(v.begin(), v.end());

    // 출력
    for (int i = 0; i < v.size(); i ++) {
        cout << v[i] << endl;
    }
    
    return 0;
}