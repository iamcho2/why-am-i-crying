// BOJ-7568 덩치
#include <iostream>
#include <vector>

using namespace std;

// Person 구조체
typedef struct Person{
    int weight;
    int height;
}Person;

// 전역 변수
int num = 0;
vector<Person> v;

// 재귀 함수
void comparePerson(int idx, int num) {
    Person me = v[idx];
    int rank = 0;
    // 본인 빼고 다 비교하기
    for(int i = 0; i < num; i++){
        if(i == idx) continue;
        Person other = v[i];
        if(other.height - me.height > 0 && other.weight - me.weight > 0){
            rank += 1;
        }
    }

    // 등수 출력
    cout << rank + 1 << " ";
}

int main() {
    cin >> num;

    for(int i = 0; i < num; i++){
        int w = 0, h = 0;
        cin >> w >> h;
        Person p = { w, h };
        v.push_back(p);
    }

    for(int i = 0; i < num; i++){
        comparePerson(i, num);
    }

}