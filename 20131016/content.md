# 프로그래밍의 원리 실습 #

2013년 10월 16일 (수) 16:00-17:50
조교 [조성근](http://ropas.snu.ac.kr/~skcho), [강지훈](http://ropas.snu.ac.kr/~jhkang)

## 실습 ##

실습의 목표는 다음과 같습니다:

+ 데이터 구현하기
+ 데이터 속구현 감추기

### 미분 ###

식을 미분해봅시다. 뼈대코드 [differentiate.rkt](differentiate.rkt)를
완성하세요.

참고로 우리가 다룰 식은

+ 상수,
+ 변수,
+ 더하기,
+ 빼기,
+ 곱셈

으로만 이루어져 있습니다. 미분하는 방법은
[위키피디아](http://ko.wikipedia.org/wiki/%EB%AF%B8%EB%B6%84)를
참조하세요.

### 유한 상태 기계 (Finite State Machine) ###

자판기를 생각해봅시다.

+ 자판기는 동전을 입력으로 받습니다.
+ 동전이 들어있을 경우, "콜라" 버튼을 누르면 콜라가 나옵니다.
+ 동전이 들어있을 경우, "사이다" 버튼을 누르면 사이다가 나옵니다.
+ 동전이 들어있을 경우, "반환" 버튼을 누르면 동전이 나옵니다.
+ 동전이 들어있을 경우, 동전을 또 넣으면 새로 넣은 동전이 반환됩니다.

이 자판기를 수학적으로 표현해봅시다. 먼저 이 자판기는 두 개의 상태가
있습니다:

+ 동전이 안 들어있는 경우 (```initial```)
+ 동전이 들어있는 경우 (```coined```)

자판기에 줄 수 있는 입력은 다음과 같습니다:

+ 동전 넣기 (```insert-coin```)
+ "콜라" 버튼 누르기 (```push-cola```)
+ "사이다" 버튼 누르기 (```push-cider```)
+ "반환" 버튼 누르기 (```push-return```)

자판기가 줄 수 있는 출력은 다음과 같습니다:

+ 아무것도 안하기 (```nothing```)
+ 동전 반환하기 (```coin```)
+ 콜라 주기 (```cola```)
+ 사이다 주기 (```cider```)

이를 토대로 자판기를 그림으로 표현하면 다음과 같습니다:

TODO

이런 형태의 그래프를 **유한 상태 기계 (finite state machine)**이라고
부릅니다. 보다 자세한 내용은
[위키피디아](http://ko.wikipedia.org/wiki/%EC%9C%A0%ED%95%9C_%EC%83%81%ED%83%9C_%EA%B8%B0%EA%B3%84)를
참조하세요.

여러분이 할 일은 유한 상태 기계의 내부를 구현하는 것입니다. 다음과 같은
함수를 구현하세요. 이 때 ```input```, ```output```, ```state```는 모두
문자열(string)인 것으로 가정합니다:

```racket
init-fsm: fsm
add-rule-fsm: state * input * state * output * fsm -> fsm
step-fsm: state * input * fsm -> state X output
run-fsm: state * input list * fsm -> state X output list
```

[뼈대코드](fsm.rkt)에는 이미 이 인터페이스를 이용해서 자판기가 구현되어
있습니다. 자판기가 의도한대로 동작하도록 빈 칸을 채워넣으면 됩니다.
