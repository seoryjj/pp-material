# 프로그래밍의 원리 실습 #

2013년 11월 20일 (수) 16:00-17:50 조교
[조성근](http://ropas.snu.ac.kr/~skcho),
[강지훈](http://ropas.snu.ac.kr/~jhkang)

이번 실습에서는 OCaml의 모듈과 모듈함수 사용법을 익혀 봅시다.

## 모듈 ##

모듈은 OCaml에서 타입, 변수, 함수 정의의 모음입니다.  예를 들어,
정수타입과 이에 대한 연산들을 다음과 같이 정의할 수 있고, 이들을 모두
모듈로 정의할 수 있습니다.

```ocaml
module MyInt = 
struct 
  type t = int
  let add (x:t) (y:t) : t = x+y
  let to_string (x:t) = string_of_int x  
end
```

모듈 안의 내용물을 사용하는 방법은 "모듈이름.타입", "모듈이름.변수",
"모듈이름.함수"입니다.  다음 코드를 실행시켜 보세요.

```ocaml
let one : MyInt.t = 1
let two : MyInt.t = 2
let three : MyInt.t = MyInt.add one two
let _ = print_endline (MyInt.to_string three)
```

## 모듈타입 ##

변수나 함수에 타입이 있듯이 모듈에도 타입이 있습니다.  모듈타입은
다음과 같은 내용을 담고 있습니다.

* 어떤 모듈 안에 어떤 타입이 정의되어 있어야 함.
* 어떤 모듈 안에 어떤 변수/함수가 어떤 타입으로 정의되어 있어야 함.

예제에서 보인 모듈의 타입은 다음과 같습니다.

```ocaml
module type Num = 
sig
  type t
  val add : t -> t -> t
  val to_string : t -> string
end
```

`Num`이라는 모듈타입의 내용은 다음과 같습니다.

* `t`라는 타입이 정의되어 있어야 함.
* 두 개의 `t` 타입의 값을 받아서 `t` 타입의 값을 내놓는 `add`라는
  함수가 정의되어 있어야 함.
* `t` 타입을 받아서 문자열을 내놓는 `to_string`이라는 함수가 정의되어
  있어야 함.

## 모듈함수 ##

모듈을 인자로 받아서 모듈을 내놓는 모듈함수를 정의해 봅시다.
여기에서는 두 개의 `Num`모듈타입의 모듈을 인자로 받아서 `Num`모듈타입의
모듈을 내놓는 `Pair`모듈함수를 정의해 보겠습니다.

```ocaml
module Pair (M:NumType) (N:NumType) : NumType with type t = M.t * N.t =
struct
  type t = M.t * N.t
  let add (x:t) (y:t) = 
    match x,y with
    | (x1,x2),(y1,y2) -> (M.add x1 y1,N.add x2 y2)
  let to_string (x:t) = 
    match x with
    | (x1,x2) -> "("^(M.to_string x1)^","^(N.to_string x2)^")"
end

module MyIntPair = Pair (MyInt) (MyInt)
let one_two : MyIntPair.t = (one,two)
let two_three : MyIntPair.t = (two,three)
let three_five : MyIntPair.t = MyIntPair.add one_two two_three
let _ = print_endline (MyIntPair.to_string three_five)

module MyIntPairPair = Pair (MyIntPair) (MyInt)
let _ = print_endline (MyIntPairPair.to_string (one_two,three))
```

`Pair`모듈함수를 이용해서 만든 `MyIntPair`모듈은 `MyInt.t`의 쌍에 대한
`add`함수와 `to_string`함수를 가지게 됩니다.  더 재미난 것은
`MyIntPair` 또한 `NumType`을 가지므로 `Pair`모듈함수의 인자로 쓰일 수
있습니다.

## 실습 ##



### Set, Map ###


