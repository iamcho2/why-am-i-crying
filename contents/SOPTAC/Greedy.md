# Greedy

를 공부할 땐

<img src="https://user-images.githubusercontent.com/28949235/117564096-38179100-b0e5-11eb-8fc5-c1dbec8cd588.png" alt="image" style="zoom:50%;" />

를 들어줘야 하는 것이 규칙 ㅋ

## Greedy 알고리즘

> 미래를 생각하지 않고 각 단계에서 가장 최선의 선택을 하는 기법

해당 순간의 선택은 **그 당시 최적** (locally optimal) 일 수는 있으나  
**최종적으로 최적** (globally optimal) 이라는 보장은 없음 : 확인해야 함!!

### 최소 신장 트리

> minimum spanning tree
>
> 주어진 가중치 그래프에서 사이클 없이 모든 점들을 연결시킨 트리들 중  
> 선분들의 가중치 합이 최소인 트리

<img src="https://user-images.githubusercontent.com/28949235/117564289-6053bf80-b0e6-11eb-999e-6525bf65e54c.png" alt="image" style="zoom:25%;" /> : 가중치 그래프

<img src="https://user-images.githubusercontent.com/28949235/117564309-73ff2600-b0e6-11eb-8811-ee02d702a64f.png" alt="image" style="zoom:25%;" /> : 최소 신장 트리

<img src="https://user-images.githubusercontent.com/28949235/117564316-782b4380-b0e6-11eb-92c2-c2ca57d0de62.png" alt="image" style="zoom:25%;" /> : 신장 트리 (사이클은 없지만 가중치 합이 최소는 아님)

#### 그리디 - 크러스컬 알고리즘

>  모든 노드 중 가중치가 가장 작은 선분이 사이클을 만들지 않을 때에 그리디하게 그 선분을 추가

<img src="https://user-images.githubusercontent.com/28949235/117564464-1f0fdf80-b0e7-11eb-8f2c-0f8aec48621f.png" alt="image" style="zoom:33%;" />

요런 가중치 그래프가 있을 때

<img src="https://user-images.githubusercontent.com/28949235/117564457-1919fe80-b0e7-11eb-9fe2-0fdc6eaa01c4.png" alt="image" style="zoom:33%;" />

이렇게 선분들을 가중치 순서대로 정렬 후, 가장 작은것 부터 추가한다.  
추가 할 때, 사이클을 만들지 않는 한에서 선분을 선택!

#### 그리디 - 프림 알고리즘

> 처음에 임의의 점을 선택
>
> 열려 있는 **노드** 중 가중치가 가장 적은 선분이 사이클을 만들지 않을 때에만 그리디하게 그 선분을 추가

#### 최적해인지 확인하기

그리디 - 크러스컬, 그리디 - 프림 알고리즘을 사용해서 구한 해(최소신장트리)가 다르다.  
어떤 경우에서는 다른 최적해가 있을 수 있다.  
But... 현실 세계에서는 최적해를 하나하나 찾거나 검토하기보단  
그냥 그리디로 찾고 최적해가 아니더라도 즐거운 마음으로 사용하는 경우도 많다고 한다.

추가로, 코테에서는 그리디를 쓰는 문제라면 그리디를 썼을 때 최적해가 나오는 문제만 출제!