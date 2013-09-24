# 프로그래밍의 원리 실습 #

2013년 9월 25일 (수) 16:00-17:50
조교 [조성근](http://ropas.snu.ac.kr/~skcho), [강지훈](http://ropas.snu.ac.kr/~jhkang)

## 공지 ##

* 실습반이 4시반과 5시반으로 구분되었습니다.
* 숙제 3이 나왔습니다.
  + 문제 1은 타입을 주석으로 다는 문제입니다. 실습 자료에 제시된 것과
    같이 주석을 달면 됩니다.
* 숙제 채점 및 동료평가 방식이 변경되었습니다.
  + [조교 홈페이지](http://ropas.snu.ac.kr/~ta/4190.210/13/)를
    참고하세요.
  + [Crowdgrader 설명](https://github.com/lunaticas/pp-material/blob/master/crowdgrader/crowdgrader.md)도
    참고하세요 ([Crowdgrader explanation](https://github.com/lunaticas/pp-material/blob/master/crowdgrader/crowdgrader_en.md)).

## 실습 ##

* ```eval-list```

```eval-list```는 정수 리스트를 입력으로 받아서 각 정수가 짝수인지
여부를 리스트로 돌려주는 함수입니다.  빈 칸을 채워 넣어봅시다.

```racket
(define (iseven n) (= (modulo n 2) 0)) ; iseven: int -> bool
(define (even-list items) even-list: ; int list -> bool list
  (if (null? items)
    '()
    (cons (raise "TODO") (even-list (raise "TODO")))))
```

* ```map```

```even-list```는 ```map```으로 쉽게 만들 수 있습니다. ```map```은
리스트의 각 원소에 인자로 받은 함수를 적용하여 그 결과를 리스트로
만들어줍니다.

```racket
(define (even-list-map items)
  (map iseven items))
```

```map```과 똑같이 동작하는 ```my-map```을 만들어 봅시다. 예를 들어,

```racket
(my-map abs (list -1 -2 -3 4))
```

의 결과는 ```'(1 2 3 4)```이 나와야 합니다.

* ```fold```

```fold```는 리스트와 함수, 초기값을 입력으로 받고, 다음 연산을
수행합니다.

```racket
(fold (a1 a2 ... an) f c) = (f a1 (f a2 (... (f an c) ...)))
```

정의는 다음과 같습니다.

```racket
(define (fold lst f c)
  (if (null? lst) c
  (f (car lst) (fold (cdr lst) f c))))
```

주어진 ```fold```의 정의와 ```even-list```, ```or```를 사용해서 어떤
정수 리스트에 짝수가 있는지 알아보는 함수 ```has-even```을 만들어
봅시다. 사용법은 다음과 같습니다.

```racket
(has-even '(1 2 3 5)) ; \#t
(has-even '(-1 1 3)) ; \#f
```
* 사전(dictionary)은 키워드와 그에 대응하는 값을 쌍으로 가지고
있습니다. 사전을 만들고 사용하는 다음의 함수들이 정의되어 있습니다.

```racket
empty-dic : dictionary
add-dic : string -> any -> dictionary -> dictionary
find-dic : string -> dictionary → any
```

[```dictionary-list.rkt```](dictionary-list.rkt)에 사전의 구현이
있습니다. [```dictionary-use.rkt```](dictionary-use.rkt)에 사전을
사용한 예가 있습니다.

[```dictionary-function.rkt```](dictionary-function.rkt)에 함수로
사전을 구현하세요. ```empty-dic```은 건드리지 말고, ```add-dic```과
```find-dic```을 만들면
됩니다. [```dictionary-use.rkt```](dictionary-use.rkt)에서
```require```하는 파일을 바꾼 뒤에도 잘 동작하는지 확인하면 됩니다.
