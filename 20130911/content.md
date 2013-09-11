# 프로그래밍의 원리 실습 #

2013년 9월 11일 (수) 16:00-17:50
조교 [조성근](http://ropas.snu.ac.kr/~skcho), [강지훈](http://ropas.snu.ac.kr/~jhkang)

## 숙제 ##

[숙제1 다운로드](http://ropas.snu.ac.kr/~kwang/4190.210/13/hw1.pdf)

[구글 메일 주소 등록](https://docs.google.com/forms/d/1qfm9xJmWguqvm1dFZc4X0L3RGHArKltmV7-CQThwH5Y/viewform): 수요일까지 구글 이메일 주소를 등록하세요.
숙제 제출은 모든 학생의 이메일 주소가 모아지는 수요일 저녁부터 가능하도록 준비하겠습니다.

[숙제 제출 시스템](http://www.crowdgrader.org/): crowdgrader를 사용합니다.
자세한 내용은 다음 문서를 참고하세요.

* [숙제 제출 시스템 설명](https://github.com/lunaticas/pp-material/blob/master/crowdgrader/crowdgrader.md)
* [숙제 제출 시스템 설명(English)](https://github.com/lunaticas/pp-material/blob/master/crowdgrader/crowdgrader_en.md)

숙제 제출 파일 형식: 숙제 제출은 각 문항별로 .rkt파일을 올려주시면 됩니다.

재제출: 숙제의 재제출은 제출기한+delay기한내에 가능합니다. 마지막에 제출된 것을 기준으로 채점을 합니다.

Delay 규정: 24시간까지 10%, 48시간까지 20% 감점합니다. 이후에는 숙제를 받지 않습니다.

숙제 관련한 질문이 있으시면 게시판을 적극적으로 활용해주세요.

## 실습조 ##

### 실습조 확정 ###

실습조를 확정하여 게시판에 게시합니다.

### 분반 ###

4시, 5시 두 반으로 분반합니다.
* 학기의 반(5회)이 지난 후에 4시반과 5시반을 바꿉니다.
* 반 편성은 전적으로 **랜덤**으로 결정됩니다.

## 실습 과제 ##

숙제 1을 해결하기 위해 필요한 개념들을 배우는 것이 오늘의 목표입니다.

### Racket의 값과 표현식 ###

#### 값 ####

Racket에는 다양한 값들이 있습니다.

* 숫자
```racket
1
```

* 문자열
```racket
"Principles of Programming"
```

* 순서쌍
```racket
(cons 2 3)
```

* 리스트
```racket
'(1 2 3 4 5)
```

* 함수
```racket
(lambda (x) (+ x 1))
```

#### 표현식 ####

이와 같은 값으로 실행되는 표현식들이 있습니다.

```racket
(+ -1 2)
```

```racket
(string-append "Principles " "of " "Programming")
```

```racket
(cons (+ 1 1) (+ 1 2))
```

```racket
(append '(1 2) '(3 4 5))
```

```racket
((lambda (f) f) (lambda (x) (+ x 1)))
```

이외에도 다양한 표현식을 익혀봅시다:
```racket
if, equal?, or, and, +, -, *, /, <, quotient, remainder, ...
```

```racket
(if (equal? 1 2) "X" "O")
```

```racket
(if (or (equal? 1 2) (equal? 3 3)) "O" "X")
```

```racket
(if (and (equal? 1 2) (equal? 3 3)) "X" "O")
```

```racket
(+ 1 2 3 4 5)
```

```racket
(+ (* 1 2) (/ 3 4) (quotient 5 6) (remainder 7 8) (- 9 10))
```

```racket
(equal? "a" "a")
```

```racket
(if (< 1 2) "O" "X")
```

#### 순서쌍 ####

순서쌍을 만들기 위해서는 ```cons```, 앞의 원소를 꺼내기 위해서는
```car```, 뒤의 원소를 꺼내기 위해서는 ```cdr```을 사용합니다.

```racket
(car (cons 1 (cons 2 "three")))
```

```racket
(cdr (cons 1 (cons 2 "three")))
```

#### 리스트 ####

리스트는 Racket에서 매우 많이 사용되는 자료구조입니다. 리스트는 사실
순서쌍을 특정한 방법으로 늘어놓은 것입니다.

```racket
(cons 0 (cons 1 (cons 2 '())))
```

```racket
(cons 0 '(1 2 3 4 5))
```

```racket
(cons 1 '())
```

비어있는지 확인할 수 있습니다.

```racket
(null? '())
```

```racket
(null? '(1 2 3))
```

두 리스트를 합쳐봅시다.

```racket
(append '(1 2) '(3 4))
```

* 또한 이와 같이 쓰기보다는:
```racket
'(1 2 (+ 1 2) 4 5)
```

* 이와 같이 쓰세요:
```racket
(list 1 2 (+ 1 2) 4 5)
```

### Define ###


```define```을 이용하여 표현식을 변수에 대입할 수 있습니다. 표현식이
얼마나 복잡하든지 상관 없습니다.

```racket
(define s (string-append "Hello, " "World!\n"))
(print s)
```

```racket
(define lst '(1 3 5 7))
```

```racket
(define f (lambda (x) (+ x 1)))
(f 1)
```

```racket
(define f (lambda (x y z) (+ x y z)))
(f 2 3 4)
```

함수를 ```define```하기 위한 편리한 방법이 있습니다.

```racket
(define (mySum a b) (+ a b))
(mySum 5 6)
```

```racket
(define (myIdentity x)
	(if (equal? 0 x)
		0
		(+ (myIdentity (- x 1)) 1)))
(myIdentity 5)
```

### 재귀함수 ###

* 어떤 함수(foo)를 정의할 때 그 함수(foo)가 사용되는 경우, 이러한
  함수를 *재귀함수*라 부릅니다.  아래의 예에서는 리스트의 순서를 뒤집는
  재귀함수 `myRev`를 정의합니다.
  
```racket
(define (myRev l)
  (if (null? l)
      null
      (append (myRev (cdr l)) (list (car l)))))
(myRev (list 1 2 3 4))
```

  `myRev`의 정의 안에 `myRev`가 사용되고 있는 것을 알 수 있죠?  이러한
  재귀함수는 리스트와 같이 크기가 정해져있지 않은 타입의 데이터를
  가공하는데에 유용하게 쓰입니다.
  
* 리스트의 모든 원소에 2을 더하는 재귀함수

```racket
(define (add_two l)
  (if (null? l)
      null
      (cons (+ (car l) 2) (add_two (cdr l)))))
(add_two (list 1 2 3 4))
```

### 과제 ###

* 주어진 수의 부호를 알아내는 함수를 만들어봅시다.

```racket
(define (sign x)
    (raise "TODO"))
(sign 0) ; "0"
(sign 1) ; "+"
(sign -1) ; "-"
```

* 주어진 수의 절대값을 알아내는 함수를 만들어봅시다.

```racket
(define (absolut x)
    (raise "TODO"))
(absolut 0) ; 0
(absolut 1) ; 1
(absolut -1) ; 1
```

* 자연수의 리스트를 받고 리스트에서 가장 큰 수를 찾는 함수를 만들어봅시다.

```racket
(define (maxima lst)
    (raise "TODO"))
(maxima '()) ; 0
(maxima '(1 5 2 4 3)) ; 5
(maxima '(7 3 1)) ; 7
```
