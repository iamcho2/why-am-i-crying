# DFS, BFS

### Graph

간선 (Edge)과 정점(Vertex = Node) 들의 집합 G = (E,V)  
드리와 달이 그래프는 사이클이 존재하나 루트 노드, 부모-자식 개념이 없다

<img src="https://user-images.githubusercontent.com/28949235/122501745-43d56c00-d030-11eb-8e16-e4c78e08c627.png" alt="image" width=300px />

종류 : 무방향 그래프, 방향 그래프, 가중치 그래프

### Graph 탐색

> 그래프에 존재하는 모든 노드 (정점)을 한 번씩 다 방문하는 것

* **DFS** (깊이 우선 탐색, Depth-First Search)
  * 최대한 깊이 내려간 뒤 더 이상 갈 곳이 없을 경우 옆으로 이동
  * 재귀 사용
* **BFS** (넓이 우선 탐색, Breadth-First Search)
  * 최대한 넓게 이동한 후 더 이상 갈 곳이 없을 경우 아래로 이동
  * 큐 사용

## DFS: 깊이 우선 탐색

<img src="https://user-images.githubusercontent.com/28949235/122502226-310f6700-d031-11eb-851d-bd28bb993f36.png" alt="image" width=300px />

- 미로를 탐색할 때 한 방향으로 갈 수 있을 때까지 계속 가다가  
  더 이상 갈 수 없게 되면 다시 가장 가까운 갈림길로 돌아와서  
  이곳으로부터 다른 방향으로 다시 탐색을 진행하는 방법과 유사함
- 즉 넓게(wide) 탐색하기 전에 깊게(deep) 탐색함
- 모든 노드를 방문하고자 하는 경우에 이 방법을 선택함
- 깊이 우선 탐색(DFS)이 너비 우선 탐색(BFS)보다 좀 더 간단함
- 검색 속도 자체는 너비 우선 탐색(BFS)에 비해서 느림

### 구현

> 현재 정점에서 갈 수 있는 정점까지 모두 들어가면서 탐색

```c++
// 보통 vector를 사용한 인접 리스트로 구현
vector<int> v[N];
bool visit[N];
void dfs(int start){
  visit[start] = true; //방문 체크
  printf("%d", start); // 현재 방문 정점 출력
  for(int vertex: v[start]){
    if(!visit[vertex]);{ // 방문하지 않은 정점이 있다면
      dfs(vertex); // 방문한다
    }
  }
}
int main(){
  ...
    dfs(시작 정점);
}
```



## BFS: 너비 우선 탐색

<img src="https://user-images.githubusercontent.com/28949235/122502349-6d42c780-d031-11eb-822c-aaf039745cda.png" alt="image" width=300px />

- 시작 정점으로부터 가까운 정점을 먼저 방문하고 멀리 떨어져있는 정점을 나중에 방문한다
- 두 노드 사이의 최단 경로 혹은 임의의 경로를 찾고 싶을 때 이 방법을 선택
- 재귀적으로 동작하지 않음
- 어떤 노드를 방문했었는지 여부를 반드시 검사해야 함
- 방문한 노드들을 차례로 저장한 후 꺼낼 수 있는 자료구조인 큐(queue)를 사용

### 순서대로 이해하기

<img src="https://user-images.githubusercontent.com/28949235/122502468-ab3feb80-d031-11eb-94ce-d0c7f731447d.png" alt="image" width=300px />

| 출력                    | 큐          |
| ----------------------- | ----------- |
|                         | 1           |
| 1                       | 2 3 4       |
| 1 2                     | 3 4 5 6     |
| 1 2 3                   | 4 5 6 8     |
| 1 2 3 4                 | 5 6 8 10 11 |
| 1 2 3 4 5               | 6 8 10 11   |
| 1 2 3 4 5 6             | 8 10 11 7   |
| 1 2 3 4 5 6 8           | 10 11 7 9   |
| 1 2 3 4 5 6 8 10        | 11 7 9      |
| 1 2 3 4 5 6 8 10 11     | 7 9         |
| 1 2 3 4 5 6 8 10 11 7   | 9           |
| 1 2 3 4 5 6 8 10 11 7 9 |             |

### 구현

```c++
int main(){
  ...
 	queue<int> q;
  q.push(start);
  visit[start] = true; //시작 정점 처리
  while(!q.empty()){
    int vertex = q.front(); // 현재 정점 큐에서 빼온다
    q.pop();
    printf("%d", vertex); // 현재 정점 출력
    for(int next : v[vertex]){
      if(!visit[next]){
        q.push(next); // 다음 정점 push
        visit[next] = true // 방문 처리
      }
    }
  }
}
```

## 문제 유형

1. 그래프의 **모든 정점**을 방문해야 하는 문제

2. **최단 거리** 문제 - **BFS**

   (DFS로 최단 거리를 구함녀 해당 경로가 최단 거리가 아닐 수 있음)

3. **경로의 특징**을 저장해야 하는 문제 -  **DFS**

   (ex: 1-6까지 가는 거리 도중에 같은 노드를 만나면 안된다)
