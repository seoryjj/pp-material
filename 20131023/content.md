# 프로그래밍의 원리 실습 #

2013년 10월 23일 (수) 16:00-17:50
조교 [조성근](http://ropas.snu.ac.kr/~skcho), [강지훈](http://ropas.snu.ac.kr/~jhkang)

## 실습 ##

### 복소수 ###

복소수 타입을 만들어 봅시다. 복소수는 두 가지 방식으로 나타낼 수
있습니다.

+ 직각 좌표계: 어렸을적부터 익숙하게 ```(x, y)```로 표현합니다.
+ 극좌표계: ```(r, θ)```는 길이 ```r```, 각도 ```θ```인 점입니다.

둘 모두 ```real X real``` 타입이므로, 둘을 태깅해서 구분하는 것이
좋습니다. 예를 들어,

+ ```(cons 'rect (cons 1 pi))```는 직각 좌표계의 좌표 ```(1,
  pi)```입니다.
+ ```(cons 'polar (cons 1 pi))```는 극좌표계의 좌표 ```(1, pi)```, 즉
  직각 좌표계로는 ```(-1,0)```입니다.

다음 직각 좌표계 복소수에 관한 함수를 만들어봅시다.
```racket
is-c-rect?: c-rect -> bool
c-rect-make: number * number -> c-rect
c-rect-real: c-rect -> number
c-rect-imaginary: c-rect -> number
```

또 다음 극좌표계 복소수에 관한 함수를 만들어봅시다.
```racket
is-c-polar?: c-polar -> bool
c-polar-make: number * number -> c-polar
c-polar-real: c-polar -> number
c-polar-imaginary: c-polar -> number
```

다음 어떤 좌표계로 표현된 복소수를 입력으로 받아도 잘 동작하는 다음
함수를 만들어봅시다.
```racket
c-real: complex -> number
c-imaginary: complex -> number
c-angle: complex -> number
c-radius: complex -> number
c-conjugate: complex -> complex
```

복소수와 관련된 연산은 위키피디아를 참조하세요.

+ [복소수](http://ko.wikipedia.org/wiki/%EB%B3%B5%EC%86%8C%EC%88%98)
+ [극좌표계](http://ko.wikipedia.org/wiki/%EA%B7%B9%EC%A2%8C%ED%91%9C%EA%B3%84)

```racket
(define c1 (c-rect-make 1 2))
(define c2 (c-rect-make 3 4))
(define c3 (c-polar-make 0.7 3))
(define c4 (c-polar-make 0.5 2))

(c-rect-real c1) ; 1
(c-rect-imaginary c2) ; 4
(c-polar-angle c3) ; 0.7
(c-polar-radius c4) ; 2
(is-c-rect? c1) ; #t
(is-c-rect? c3) ; #f
(is-c-polar? c4) ; #t
(c-real c1) ; 1
(c-real c3) ; 2.2945265618534654 = (* 3 (cos 0.7))
(c-imaginary c2) ; 4
(c-imaginary c4) ; 0.958851077208406 = (* 2 (sin 0.5))
(c-angle c1) ; 1.1071487177940904;(atan 2 1)
(c-angle c3) ; 0.7
(c-radius c2) ; 5 = (sqrt (+ (expt 3 2) (expt 4 2)))
(c-radius c4) ; 2

(define c5 (c-conjugate c1))
(define c6 (c-conjugate c3))

(c-real c5) ; 1
(c-imaginary c5) ; -2
(c-real c6) ; 2.2945265618534654
(c-imaginary c6) ; -1.932653061713073
```

### 값 중심 vs. 물건 중심 ###

수업시간에 *값 중심(applicative)*, *물건 중심(imperative)* 프로그래밍에
대해 배우셨을 것입니다.  이 실습시간에는 각 프로그래밍 방식을 경험해
봅시다.

#### Summation ####

0부터 10까지 더하는 프로그램을 다음과 같이 두 가지 스타일로 구현할 수
있습니다.

##### 값 중심 스타일

```racket
(define (sum_a n)
  (if (equal? n 0)
      0
      (+ n (sum_a (- n 1)))))

(sum_a 10)
```

위에서는 재귀함수를 이용해서 0부터 10까지 더하는 프로그램을
구현하였습니다.  등장하는 모든 변수(`n`)은 프로그램 실행 중 내용이
변하지 않는 **값**입니다.  

##### 물건 중심 스타일

다음은 위와 같은 함수를 물건 중심으로 구현한 예제입니다.

```racket
(define sum 0)

(define (sum_i n)
  (if (equal? n 0)
      sum
      (begin 
        (set! sum (+ n sum))
        (sum_i (- n 1)))))

(sum_i 10)
```

이 물건 중심 프로그램에는 `sum`이라는 내용이 변하는 **물건**이
등장합니다.  이 물건은 프로그램 실행 중에 내용이 차례차례 바뀌어
최종적으로 우리가 얻고자 하는 어떤 물건이 됩니다.

다음은 참고로 racket의 `for`문을 이용한 함수입니다.  자세한 내용은
racket의 [메뉴얼](http://docs.racket-lang.org/reference/for.html)을
참고하세요.

```racket
(set! sum 0)

(define (sum_i_for n)
  (for ((i (+ n 1)))
       (set! sum (+ sum i)))
  sum)

(sum_i_for 10)
```

#### 유한상태기계 ####

지난 실습시간에 구현한 자판기를 물건 중심(imperative programming)
스타일로 다시 구현해 봅시다.

다음은 오늘 구현할 유한상태기계의
[뼈대코드](https://github.com/lunaticas/pp-material/blob/master/20131023/fsm_imp.rkt)입니다.
값 중심으로 구현한 지난 시간의
[모범답안](https://github.com/lunaticas/pp-material/blob/master/20131023/fsm.rkt)과
비교해 보세요.

```racket
(define fsm null)

(define (init-fsm) ; init-fsm: unit
  (set! fsm null))

(define (add-rule-fsm curstate input newstate output) ; add-rule-fsm: state * input * state * output -> unit
  (set! fsm (cons (cons (cons curstate input) (cons newstate output)) fsm)))

(define (step-fsm curstate input) ; step-fsm: state * input -> state X output
  (let ((state curstate)
        (output "nothing"))
    (for ((rule fsm))
         (raise "TODO"))
    (cons state output)))

(define (run-fsm curstate inputs) ; run-stem: state * input list -> state X output list
  (let ((state curstate)
        (output-list null))
    (for ((input inputs))
         (raise "TODO"))
    (cons state output-list)))

(init-fsm)
(add-rule-fsm "initial" "insert-coin" "coined" "nothing")
(add-rule-fsm "initial" "push-cola" "initial" "nothing")
(add-rule-fsm "initial" "push-cider" "initial" "nothing")
(add-rule-fsm "initial" "push-return" "initial" "nothing")
(add-rule-fsm "coined" "insert-coin" "coined" "coin")
(add-rule-fsm "coined" "push-cola" "initial" "cola")
(add-rule-fsm "coined" "push-cider" "initial" "cider")
(add-rule-fsm "coined" "push-return" "initial" "coin")

(equal?
 (cons "initial" (list "nothing" "cola" "nothing" "coin" "cider" "nothing"))
 (run-fsm "initial" (list "insert-coin" "push-cola" "insert-coin" "insert-coin" "push-cider" "push-cider")))
```

여러분이 작성하셔야할 함수는 유한상태기계를 실행시키는 `step-fsm`과
`run-fsm`입니다.  다음 도움말을 참고하세요.

1. 유한상태기계를 나타내는 `fsm`은 **값**이 아니라 **물건**이다.
따라서 `add-rule-fsm`을 이용하여 룰을 추가할 때마가 그 내용이 바뀐다.

2. 유한상태기계는 `((state X input) X (state X output)) list` 타입을
갖는다.

3. `step-fsm`의 동작: (1) 유한상태기계의 모든 룰을 순회하며
현재상태(`curstate`)와 입력(`input`)에 해당하는 다음상태와 출력을 변수
`state`와 `output`에 기록; (2) 순회가 끝나면 `state`와 `output`을
출력.

4. `run-fsm`의 동작: (1) 입력리스트(`inputs`)를 순회하며 `step-fsm`을
수행.  이때 `step-fsm`의 실행결과인 상태와 출력을 `state`와
`output-list`에 기록; (2) 순회가 끝나면 `state`와 `output-list`를
출력.
