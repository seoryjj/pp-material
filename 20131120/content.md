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

let one : MyInt.t = 1
let two : MyInt.t = 2
let three : MyInt.t = MyInt.add one two
let _ = print_endline (MyInt.to_string three)
```

위에서 보시는 것과 같이 모듈 안의 내용물을 사용하는 방법은
"모듈이름.타입", "모듈이름.변수", "모듈이름.함수"입니다.

## 모듈타입 ##

변수나 함수에 타입이 있듯이 모듈에도 타입이 있습니다.  모듈타입은
다음과 같은 내용을 담고 있습니다.

* 어떤 모듈 안에 어떤 타입이 정의되어 있어야 함.
* 어떤 모듈 안에 어떤 변수/함수가 어떤 타입으로 정의되어 있어야 함.

위의 예제에서 보인 모듈 `MyInt`의 타입은 다음과 같습니다.

```ocaml
module type NumType = 
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

[int.ml](int.ml)

모듈을 인자로 받아서 모듈을 내놓는 모듈함수를 정의해 봅시다.
여기에서는 두 개의 `Num`모듈타입의 모듈을 인자로 받아서 `Num`모듈타입의
모듈을 내놓는 `Pair`모듈함수를 정의해 보겠습니다.

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

`Pair`모듈함수를 이용해서 만든 `MyIntPair`모듈은 `MyInt.t`의 쌍에 대한
`add`함수와 `to_string`함수를 가지게 됩니다.  더 재미난 것은
`MyIntPair` 또한 `NumType`을 가지므로 `Pair`모듈함수의 인자로 쓰일 수
있습니다.

## Set ##

[set.ml](set.ml)

OCaml에서 제공하는 기본 라이브러리 Set모듈을 사용해 봅시다.

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

위의 예제에서는 Set라이브러리의 `Set.Make`모듈함수를 이용하여 정수집합
`IntSet`을 구현합니다.  정수의 집합을 만들기 위해서는
`Set.OrderedType`모듈타입의 모듈을 `Set.Make`모듈함수의 인자로 넘겨
주어야 합니다.  `Set.OrderedType`은 다음의 두 가지 정의를 요구합니다.

* `t`타입: 집합의 각 원소의 타입.
* `compare`함수: 두 `t`타입의 값(`x`,`y`)을 받아서 크기를 비교함.
  `x`와 `y`가 같으면 0, `x`가 더 크면 양수, `y`가 더 크면 음수를
  출력함.

## 실습 ##

[ex.ml](ex.ml)

### Map ###

OCaml에서 제공하는 기본 라이브러리 Map모듈을 사용하여 유한상태기계의
규칙들을 저장하는 맵을 만들어 봅시다.  아래의 빈칸을 채우세요.

http://caml.inria.fr/pub/docs/manual-ocaml/libref/Map.html

```ocaml
exception TODO

module StateOrder = 
struct 
  type t = Initial | Coined
  let compare (x:t) (y:t) : int = raise TODO
end

module InputOrder = 
struct 
  type t = InsertCoin | PushCola | PushCider | PushReturn
  let compare (x:t) (y:t) : int = raise TODO
end

module Output = 
struct 
  type t = Coin | Cola | Cider | Nothing
end

module Pair (M:Map.OrderedType) (N:Map.OrderedType) =
struct 
  type t = M.t * N.t
  let compare (x:t) (y:t) : int = raise TODO
end

module StateInputOrder = Pair (StateOrder) (InputOrder)
module FsmMap = Map.Make (StateInputOrder)

let fsm = FsmMap.empty
let fsm = FsmMap.add 
  (StateOrder.Initial,InputOrder.InsertCoin) 
  (StateOrder.Coined,Output.Nothing) 
  fsm
let fsm = FsmMap.add 
  (StateOrder.Initial,InputOrder.PushCola)
  (StateOrder.Initial,Output.Nothing)
  fsm
let fsm = FsmMap.add
  (StateOrder.Initial,InputOrder.PushCider)
  (StateOrder.Coined,Output.Nothing)
  fsm
let fsm = FsmMap.add
  (StateOrder.Initial,InputOrder.PushReturn)
  (StateOrder.Coined,Output.Nothing) 
  fsm
let fsm = FsmMap.add 
  (StateOrder.Coined,InputOrder.InsertCoin)
  (StateOrder.Coined,Output.Coin)
  fsm
let fsm = FsmMap.add 
  (StateOrder.Coined,InputOrder.PushCola)
  (StateOrder.Initial,Output.Cola) 
  fsm
let fsm = FsmMap.add
  (StateOrder.Coined,InputOrder.PushCider)
  (StateOrder.Initial,Output.Cider) 
  fsm
let fsm = FsmMap.add
  (StateOrder.Coined,InputOrder.PushReturn)
  (StateOrder.Initial,Output.Coin)
  fsm

let result1 = FsmMap.find (StateOrder.Initial,InputOrder.InsertCoin) fsm
let result2 = FsmMap.find (StateOrder.Initial,InputOrder.PushCider) fsm
let result3 = FsmMap.find (StateOrder.Coined,InputOrder.PushCola) fsm
let result4 = FsmMap.find (StateOrder.Coined,InputOrder.InsertCoin) fsm
let result5 = FsmMap.find (StateOrder.Coined,InputOrder.PushCider) fsm

let _ =
  if result1 = (StateOrder.Coined, Output.Nothing)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result2 = (StateOrder.Coined, Output.Nothing)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result3 = (StateOrder.Initial, Output.Cola)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result4 = (StateOrder.Coined, Output.Coin)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result5 = (StateOrder.Initial, Output.Cider)
  then print_endline "o"
  else print_endline "x"
```

### 유한상태기계 ###

유한상태기계를 모듈로 작성해 봅시다.  아래의 빈칸을 채우세요.

```ocaml
module type FsmType =
sig
  type t
  val init : t
  val add_rule : StateOrder.t -> InputOrder.t -> 
    StateOrder.t -> Output.t -> t -> t
  val step : StateOrder.t -> InputOrder.t -> t -> StateOrder.t * Output.t
end

module Fsm = 
struct
  type t = (StateOrder.t * Output.t) FsmMap.t
  let init : t = FsmMap.empty
  let add_rule (is:StateOrder.t) (i:InputOrder.t) 
      (os:StateOrder.t) (o:Output.t) (fsm:t) : t =
    raise TODO
  let step (s:StateOrder.t) (i:InputOrder.t) (fsm:t) 
      : StateOrder.t * Output.t =
    raise TODO
end

module FsmRunMake (F:FsmType) =
struct 
  let rec run (s:StateOrder.t) (is:InputOrder.t list) (fsm:F.t) 
      : StateOrder.t * Output.t list = 
    raise TODO
end

module FsmRun = FsmRunMake (Fsm)

let result = FsmRun.run StateOrder.Initial
  [InputOrder.InsertCoin;InputOrder.PushCola;InputOrder.PushCider;
   InputOrder.PushReturn;InputOrder.InsertCoin;InputOrder.PushCola;
   InputOrder.PushCider;InputOrder.PushReturn] 
  fsm

let _ = 
  if result = 
    (StateOrder.Initial,
     [Output.Nothing; Output.Cola; Output.Nothing; 
      Output.Coin; Output.Nothing; Output.Cola; 
      Output.Nothing; Output.Coin])
  then print_endline "o"
  else print_endline "x"
```
