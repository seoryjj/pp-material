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
