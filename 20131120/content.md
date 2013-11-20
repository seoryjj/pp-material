# 프로그래밍의 원리 실습 #

2013년 11월 20일 (수) 16:00-17:50 조교
[조성근](http://ropas.snu.ac.kr/~skcho),
[강지훈](http://ropas.snu.ac.kr/~jhkang)

이번 실습에서는 OCaml의 모듈과 모듈함수 사용법을 익혀 봅시다.

## 모듈 ##

[int.ml](int.ml)

모듈은 타입, 변수, 함수 정의의 모음입니다.  예를 들어, 정수타입과 이에
대한 연산 정의를 다음과 같이 모아 모듈을 정의할 수 있습니다.

```ocaml
module MyInt = 
struct 
  type t = int
  let add (x:t) (y:t) : t = x+y
  let to_string (x:t) = string_of_int x  
end

let one : MyInt.t = 1
let two : MyInt.t = 2
let three : MyInt.t = MyInt.add one two
let _ = print_endline (MyInt.to_string three)
```

모듈 안의 내용물을 사용하는 방법은 "모듈이름.타입", "모듈이름.변수",
"모듈이름.함수"입니다.

## 모듈타입 ##

변수나 함수에 타입이 있듯이 모듈에도 타입이 있습니다.  모듈타입은
다음과 같은 내용을 담고 있습니다.

* 어떤 모듈 안에 어떤 타입이 정의되어 있어야 함.
* 어떤 모듈 안에 어떤 변수/함수가 어떤 타입으로 정의되어 있어야 함.

위 예제의 모듈 `MyInt`의 모듈타입은 다음과 같습니다.

```ocaml
module type NumType = 
sig
  type t
  val add : t -> t -> t
  val to_string : t -> string
end
```

* 타입 `t`의 정의가 있어야 함.
* `t -> t -> t`타입의 `add` 정의가 있어야 함.
* `t -> string` 타입의 `to_string` 정의가 있어야 함.

## 모듈함수 ##

모듈을 인자로 받고 모듈을 내놓는 모듈함수를 정의해 봅시다.  예로
`Num`모듈타입의 두 모듈을 인자로 받아 같은 모듈타입의 모듈을 내놓는
`Pair`모듈함수를 정의해 보겠습니다.

```ocaml
module Pair (M:NumType) (N:NumType) =
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

`Pair`모듈함수의 출력인 `MyIntPair`모듈은 `MyInt.t`의 쌍에 대한
`add`함수와 `to_string`함수를 가지게 됩니다.  더 재미난 것은
`MyIntPair`모듈 또한 `NumType`모듈타입을 가지므로 `Pair`모듈함수의
인자로 쓰일 수 있습니다.

## Set ##

[set.ml](set.ml)

OCaml에서 제공하는 Set라이브러리를 사용해 봅시다.

http://caml.inria.fr/pub/docs/manual-ocaml/libref/Set.html

```ocaml
module IntOrder =
struct 
  type t = int
  let compare (x:t) (y:t) : t = x-y
end

module IntSet = Set.Make (IntOrder)

let s = IntSet.empty
let s = IntSet.add 2 s
let s = IntSet.add 4 s
let s = IntSet.add 6 s

let t = IntSet.empty
let t = IntSet.add 3 t
let t = IntSet.add 4 t
let t = IntSet.add 5 t
let _ = IntSet.elements t

let _ = IntSet.elements (IntSet.union s t)
let _ = IntSet.elements (IntSet.diff s t)
```

Set라이브러리의 `Set.Make`모듈함수를 이용하여 정수집합 `IntSet`을
구현합니다.  `Set.Make`모듈함수의 인자는 `Set.OrderedType`모듈타입을
가져야 하고, 이는 다음 두 가지 정의를 요구합니다.

* `t`타입: 집합에서 각 원소의 타입.
* `compare`함수: `t`타입의 두 값(`x`,`y`)을 받아서 크기 비교.  `x`와
  `y`가 같으면 0, `x`가 더 크면 양수, `y`가 더 크면 음수 출력.

## 실습 ##

[ex.ml](ex.ml)의 `TODO`부분을 모두 채우세요.

### Map ###

OCaml에서 제공하는 기본 라이브러리 Map모듈을 사용하여 유한상태기계의
규칙들을 저장하는 맵을 만들어 봅시다.

http://caml.inria.fr/pub/docs/manual-ocaml/libref/Map.html

여러분이 완성해야 할 것은 다음과 같습니다.

1. `State`, `Input`모듈: `compare`함수는 `Set.OrderedType`에 정의되어
있는 `compare`와 동일.
2. `Pair`모듈타입: `Map.OrderedType`모듈타입의 두 모듈을 받아 쌍의 모듈
생성.

### 유한상태기계 ###

위에서 작성한 `FsmMap`을 이용하여 유한상태기계모듈을 작성해 봅시다.
여러분에 완성해야 할 것은 다음과 같습니다.

1. `Fsm`모듈: `FsmMap`을 이용하여 유한상태기계 생성.  `init`,
`add_rule`, `step` 함수 정의.
2. `FsmRun`모듈함수: `FsmType`모듈타입의 모듈을 인자로 받아 `run` 함수
정의.
