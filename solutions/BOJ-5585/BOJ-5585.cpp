// BOJ-5585 거스름돈
#include <iostream>
using namespace std;

int main() {
    int price, change, answer = 0;
    cin >> price;

    change = 1000 - price;
    
    // 동전 종류 : 500, 100, 50, 10, 5, 1
    int coins[6] = {500, 100, 50, 10, 5, 1};

    for (int i=0; i < 6; i++){
        if (change / coins[i] >= 1) {
        answer += change / coins[i];
        change %= coins[i];
        }
    }

    cout << answer;
}