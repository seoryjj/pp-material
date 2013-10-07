# 프로그래밍의 원리 실습 #

2013년 10월 2일 (수) 16:00-17:50
조교 [조성근](http://ropas.snu.ac.kr/~skcho), [강지훈](http://ropas.snu.ac.kr/~jhkang)

## 실습 ##

### 재귀함수와 친해지기

눈의 종류가 3인 주사위가 있다.  이 주사위를 네 번 던졌을 때, 총 두 가지
종류의 눈이 나오는 확률은 아래와 같다.  

* 1과 2의 눈이 나오는 경우: 14가지

  1112, 1121, 1211, 2111, 1122, 1212, 1221, 2112, 2121, 2211, 1222,
  2122, 2212, 2221

* 1과 3의 눈이 나오는 경우: 14가지

* 2와 3의 눈이 나오는 경우: 14가지

* 두 가지 종류의 눈이 나오는 확률: (14\*3) / (3\*3\*3\*3)

문제를 일반적으로 바꾸어, 눈의 종류가 d인 주사위가 있다.  이 주사위를
n 번 던졌을 때, 총 m 종류의 눈이 나오는 확률은 다음과 같이 구할 수
있다.

1. n<m 일 때: 이런 일은 있을 수 없으므로 확률은 0.
2. m=1 일 때: 주사위를 n 번 던지는데 한 종류의 눈만 나타날 확률은 ((1/d)^n) \* d.
3. 그렇지 않은 경우: 아래 두 확률의 합
   * (주사위를 n-1 번 던지는데 m 종류의 눈이 나오는 확률) \* (m/d).
   * (주사위를 n-1 번 던지는데 m-1 종류의 눈이 나오는 확률) \* ((d-(m-1))/d).

```prob-show```는 눈의 종류가 d인 주사위를 n 번 던졌을 때, 총 m 종류의
눈이 나오는 확률을 계산하는 함수이다.  함수를 완성하여라.

```racket
(define (prob-show n m d)
  (cond ((< n m) (raise TODO))
        ((= m 1) (raise TODO))
        (else (raise TODO))))
```

### 끝재귀(tail recursion) 연습

끝재귀는 재귀함수 호출 때, 재귀호출을 마치고 계속해야 할 일들이
누적되지 않도록 하는 프로그래밍 방법이다.

```racket
(define (fac1 n) 
   (if (= n 0) 1 (* n (fac1 (- n 1)))))
    
(define (fac2 n)
   (define (fac-aux m r)
       (if (= m 0) r (fac-aux (- m 1) (* m r))))
   (fac-aux n 1))
```

위의 두 예는 factorial 함수를 나타낸다.  `fac1`은 재귀호출을 마치고
계속해야 할 일들이 누적되는 구현이고, `fac2`는 끝재귀의 구현이다.

다음 함수를 끝재귀를 이용하도록 바꿔라.

Hint: `fibonacci-aux`의 인자 중 `a`는 `(fibonacci m)`의 값을, `b`는
`(fibonacci (m+1))`의 값을 가지도록 정의하면 된다.

```racket
(define (fibonacci1 n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fibonacci1 (- n 1)) (fibonacci1 (- n 2))))))
    
(define (fibonacci2 n)
  (define (fibonacci-aux n a b m)
    (if (= n m) 
        a
        (raise "TODO")))
  (fibonacci-aux n 0 1 0))
```

### 끝나는 프로그램

아래의 factorial 함수는 끝나는 프로그램이다.  

```racket
(define (fac n) 
   (printf "~s~n" n)
   (if (= n 0) 1 (* n (fac (- n 1)))))
```

factorial 함수가 끝나간다는 사실을 보여주기 위해 함수 중간에
```printf```명령으로 *어떤 감소하는 수*를 보여준다.  이 감소하는 수가
만족해야 하는 조건은 다음과 같다.

1. 프로그램이 실행되면서 반드시 감소한다.
2. 0보다 크거나 같다.

아래의 `my-gcd` 함수도 끝나는 프로그램이다.  `my-gcd` 함수가 끝나간다는
사실을 보여주도록 빈 칸을 채워라.  단, `my-gcd`함수의 입력은 0이거나
양의 정수이다.

```racket
(define (my-gcd n m)
  (printf "~s~n" (raise "TODO"))
  (cond ((= n 0) m)
        ((= m 0) n)
        ((< n m) (my-gcd n (- m n)))
        (else (my-gcd (- n m) m))))
```
