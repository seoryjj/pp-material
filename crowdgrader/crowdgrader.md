# 숙제제출 및 동료평가 방법

학생들의 숙제제출 및 동료평가는 [crowdgrader][]에서 이루어지며 아래의
순서와 같습니다.

1. 숙제제출
2. 다른 사람의 숙제를 채점
3. 내 숙제를 다른 사람이 채점한 것을 평가
4. 점수확인

## 숙제 제출

1. [crowdgrader][]에 접속하여 google 계정으로 로그인.

2. `SUBMIT > Submit your solutions` 클릭.

  ![step1-1](step1-1.png)

3. 제출할 문제의 `SUBMIT` 버튼 클릭.

  ![step1-2](step1-2.png)

4. 답안 파일을 업로드하고 `SUBMIT` 버튼 클릭.

  ![step1-3](step1-3.png)

## 다른 사람의 숙제를 채점

1. [crowdgrader][]에 접속하여 google 계정으로 로그인.

2. `REVIEW > Your reviewing duties` 클릭.

  ![step2-1](step2-1.png)

3. 채점할 문제의 `ACCEPT REVIEWING TASK` 클릭.

  ![step2-2](step2-2.png)

4. `DOWNLOAD ATTACHMENT`를 클릭하여 채점할 답안을 받고, `ENTER/EDIT
REVIEW` 클릭.

  ![step2-3](step2-3.png)

5. `Grade`란에 채점한 점수를, `Review`란에 채점 내용을 넣고 `SUBMIT`
클릭.

  ![step2-4](step2-4.png)

  ### 채점 방법
  
  문제 당 만점은 5점이고, 올바름 3점, 읽기 쉬움 2점으로 구성됩니다.
  
  올바름의 채점 기준은 다음과 같습니다.
  
  * 3: 프로그램이 모든 입력에 대해 제대로 동작한다.
  * 2: 프로그램이 대부분의 입력에 대해 올바로 동작하나, 오타와 같은 사소한 오류가 있다.
  * 1: 프로그램이 몇몇 입력에 대해 올바로 동작하나, 치명적인 오류가 있다.
  * 0: 프로그램이 전혀 올바르게 동작하지 않는다.

  읽기 쉬움의 채점 기준은 다음과 같습니다.
  
  * 2: 프로그램이 매우 읽기 쉽다.  
  예) 새롭게 정의된 함수들이 어떤 일을 하는지 설명이 있어 프로그램을
  이해하는 데에 무리가 없는 경우
  * 1: 프로그램을 읽을 수는 있다.  
  예) 사용된 함수/변수명이 직관적이어서 프로그램을 이해할 수 있었던
  경우에 해당합니다.
  * 0: 프로그램이 무엇을 하는지 알아 볼 수 없다.  
  예) 새롭게 정의된 함수에 대한 설명이 없고, 사용된 함수/변수명이
  직관적이지 못하여 프로그램을 이해하는 데에 어려움을 겪은 경우에
  해당합니다.

  ### 채점된 답안들의 순서 배치
  
  채점된 답안들은 `SUBMIT` 버튼을 누르기 전에 점수가 높은 순으로
  배치되어야 합니다.  만약 그렇지 못한 상태에서 `SUBMIT`를 누른다면
  다음과 같은 에러메세지를 마주하게 됩니다.  이러한 경우에 채점된
  답안을 drag하여 점수가 높은 순으로 배치한 후 `SUBMIT`를 눌러야
  합니다.
  
  ![step2-4](step2-4error.png)
  
  ![step2-4](step2-4drag.png)

  만약 같은 점수의 답안이 있다면 채점자가 생각하기에 
  
  * **더 잘했다**고 생각하는 답안의 점수를 **0.1**점 올리고, **위쪽에
    배치**하거나,
  * **더 못했다**고 생각하는 답안의 점수를 **0.1**점 내리고, **아래쪽에
    배치**하면 됩니다.
  
## 내 숙제를 다른 사람이 채점한 것을 평가

1. [crowdgrader][]에 접속하여 google 계정으로 로그인.

2. `FEEDBACK > Your submissions` 클릭.

  ![step3-1](step3-1.png)

3. 평가할 숙제의 `VIEW` 클릭.

  ![step3-2](step3-2.png)

4. 평가할 채점의 `GIVE FEEDBACK` 클릭.

  ![step3-3](step3-3.png)

5. 채점의 평가를 `Review feedback`에서 선택하고, `SUBMIT` 클릭.

  ![step3-4](step3-4.png)

## 점수확인

1. [crowdgrader][]에 접속하여 google 계정으로 로그인.

2. `SUBMIT > Your submissions` 클릭.

  ![step4-1](step4-1.png)

3. 점수를 확인할 숙제의 `VIEW` 클릭.

  ![step4-2](step4-2.png)

4. 숙제의 점수는 `SUBMISSION EVALUATION`에, 내가 한 채점의 평가는
`REVIEWING EVALUATION`에, 내가 한 채점의 평가가 20% 반영된 최종 점수는
`OVERALL ASSIGNMENT`에 나타납니다.

  ![step4-3](step4-3.png)

# crowdgrader에 대해서

* [MIT Technology Review](http://www.technologyreview.com/view/519001/first-trial-of-crowdsourced-grading-for-computer-science-homework/?utm_campaign=socialsync&utm_medium=social-post&utm_source=facebook)
* [논문](http://arxiv.org/abs/1308.5273)

[crowdgrader]: http://www.crowdgrader.org/
