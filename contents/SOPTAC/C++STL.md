# C++ STL

### STL : Standard Template Library

C++에서 제공되는 표준 라이브러리  
`#include <라이브러리 이름>`

## Vector 벡터

> 자료의 길이를 변경할 수 있는 배열

```c++
#include <vector>

int main() {
  // vector<자료형> 이름;
  vector<int> v1;
  vector<int> v2(6,1);
  vector<int> v3 = {1, 2, 3, 4, 5};
}
```

### 자주 쓰는 함수

* `push_back(' ')` 맨 뒤에 원소 추가

  * ```c++
    vector<int> a = {1, 2, 3, 4, 5};
    a.push_back(6); // [1, 2, 3, 4, 5, 6]
    a.push_back(7); // [1, 2, 3, 4, 5, 6, 7]
    ```

* `pop_back()` 맨 뒤에 원소 삭제

  * ```c++
    a.pop_back(); // [1, 2, 3, 4, 5, 6]
    ```

* `clear()` 배열 비우기

  * ```c++
    a.clear();
    ```

* `size()` 사이즈 return

  * ```c++
    a.size();
    ```

  * 배열의 길이. 주로 loop를 돌릴 때 유용

  * ```c++
    for (int i=0; i < a.size(); i++) {
      cout << a[i] << ' ';
    }
    ```



## Stack 스택

> LIFO (Last In, First Out) 구조

```c++
#include <stack>

int main() {
  stack<int> s;
}
```

### 자주 쓰는 함수

* `push('')` 원소 추가

  * ```c++
    s.push(6);
    ```

* `pop()` 맨 뒤에 원소 삭제

  * ```c++
    s.pop();
    ```

* `top()` 맨 앞에 원소 return

  * ```c++
    while (!s.empty()) {
      cout << s.top() << ' ';
      s.pop();
    }
    ```

* `empty()` 스택이 비어있으면 true, 아니면 false
* `size()` 스택 사이즈 return



## Queue 큐

> FIFO(First In, First Out) 구조

```c++
#include <queue>

int main() {
  queue<int> q;
}
```

### 자주 쓰는 함수

* `push(' ')` 맨 뒤에 원소 추가

  * ```c++
    q.push(6);
    ```

* `pop()` 맨 앞에 원소 삭제

  * ```c++
    q.pop()
    ```

* `front()` 맨 앞에 원소 return

  * ```c++
    while (!q.empty()) {
      cout << q.front() << ' ';
      q.pop();
    }
    ```

## Deque 덱

> deque = double-ended queue  
> 큐와 같은 개념이나 **양쪽에서 삽입/삭제**가 가능

![image](https://user-images.githubusercontent.com/28949235/116032437-aa768300-a69a-11eb-872f-cff9567a9e66.png)

```c++
#include <deque>

int main() {
  deque<int> dq;
}
```

### 자주 쓰는 함수

* `pop_front()`, `pop_back()`

* `push_front()`, `push_back()`

* `size()` 원소 개수 반환
* `empty()` 덱이 비었으면 true 반환



## priority_queue 우선순위 큐

> 데이터의 입력 순서와 상관없이 우선순위에 따라 처리됨

![image](https://user-images.githubusercontent.com/28949235/116032643-06d9a280-a69b-11eb-8971-49b7674ade91.png)

```c++
#include <queue>

int main() {
  // priority_queue<자료형, 컨테이너, 비교함수> 이름;
  priority_queue<int, vector<int>, greater<int> > pq;
}
```

### 자주 쓰는 함수

* `size()` 원소 개수 반환

* `empty()` 큐가 비었으면 true 반환

* `top()`

  * ```c++
    pq.top() // 루트 노드 (최솟값) 출력
    ```

* `pop()`

  * ```c++
    pq.pop(); // 루트 노드 값 삭제
    ```

### 자주 쓰는 비교 함수

> default: **max-heap**

* `greater<자료형>` 오름차순 (min-heap)
* 기본 - `priority_queue<int> name;` -> 내림차순

### 심화

**priority_queue + pair + 사용자 정의 함수**

> pair나 struct를 통해 여러가지 자료형을 삽입하고  
> 사용자 정의 함수를 통해 원하는 우선순위로 처리할 수 있음

```c++
#include <iostream>
#include <string>
#include <vector>
#include <queue>

using namespace std;
typedef pair<int, string> student;
struct cmp {
  bool operator()(student &a, student &b) {
    return a.second > b.second;
    // a.second가 b.second보다 크면 swap -> 사전 순 정렬
    // 이름 순
  }
};

int main() {
  priority_queue<student, vector<student>, cmp> pq;
  pq.push({1, "jerry"});
  pq.push({2, "tom"});
  pq.push({3, "lisa"});
  pq.push({4, "bob"});
  pq.push({5, "key"});
  
  while (!pq.empty()) {
    cout << pq.top.first << " " << pq.top().second << '\n';
    pq.pop();
	}
}
```

```c++
// 출력
4 bob
1 jerry
5 key
3 lisa
2 tom
```

## map/set

<img src="https://user-images.githubusercontent.com/28949235/116034123-b879d300-a69d-11eb-91a7-ea2591a2cf68.png" alt="image" style="zoom:30%;" />

* map
  * key-value가 한 쌍인 트리 구조
  * key는 중복 X, 중복시 값 갱신 (덮어씌워짐)
  * key를 기준으로 자동 정렬
* set
  * key만 존재, 집합 개념
  * key 중복 X
  * key를 기준으로 자동 정렬

## map

```c++
#include <map>

int main() {
  // map<key, value 자료형> 이름;
  map<string, int> m;
  map<string, int>::iterator it; //iterator를 통해 접근
}
```

### 자주 쓰는 함수

* `insert([key, value])` 삽입
* `erase(key)` 해당 key, value 삭제
* `clear()` map 모든 원소 삭제
* `find(key)` key값에 해당하는 iterator 반환
  * key가 없다면 map의 끝 반환

> iterator 선언 대신 auto it 가능 (c++ 11 이후)

### 사용

```c++
#include <iostream>
#include <map>
#include <string>

using namespace std;
int main() {
  map<string, int> m;
  map<string, int>:: iterator it; // iterator를 통해 접근
  m["lisa"] = 23;
  m["lisa"] = 24; // lisa 중복이니 value 갱신
  m["bob"] = 21;
  m["tom"] = 20;
  
  m.insert({"key", 22}); // insert 함수로 삽입
  m.erase("bob"); // erase 함수로 삭제
  for(it = m.begin; it != m.end(); it++){
    cout << it->first << " " << it->second << "\n";
    // iterator로 접근해야 함
   }
}
```

```c++
// 출력
key 22
lisa 24
tom 20
```



## set

```c++
#include <set>

int main() {
  set<key 자료형> 이름;
}
```

### 자주 쓰는 함수들

* `insert(key)` 삽입
* `erase(key)` 해당 key 삭제
* `clear()` set 모든 원소 삭제
* `find(key)` key값에 해당하는 iterator 반환
  * key가 없다면 set의 끝 반환

> iterator 선언 대신 auto it 가능 (c++ 11 이후)

### 사용

```c++
#include <iostream>
#include <set>

using namespace std;
int main() {
  set<int> s;
  s.insert(1);
  s.insert(4);
  s.insert(2);
  s.insert(5);
  s.insert(3);
  s.erase(5);
  
  for(auto it = s.begin(); it != s.end(); it++){
    cout << *it << " ";
  }
  auto it = s.find(5);
  if(it == s.end()) cout << "can't find";
}
```

```
// 출력
1 2 3 4 can't find
```

