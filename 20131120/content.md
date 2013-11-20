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

## Set ##

OCaml에서 제공하는 기본 라이브러리 Set모듈을 사용해 봅시다.

http://caml.inria.fr/pub/docs/manual-ocaml/libref/Set.html

```ocaml
module IntOrder =
struct 
  type t = int
  let compare (x:t) (y:t) = x-y
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

## 실습 ##

### 유한상태기계 ###

유한상태기계를 모듈로 작성해 봅시다.  아래의 빈칸을 채우세요.

```ocaml
exception TODO

module type FsmType =
sig
  type state
  type input
  type output
  type t

  val init : t
  val add_rule : state -> input -> state -> output -> t -> t
  val step : state -> input -> t -> state * output
end

module type FsmRunType =
sig
  type state
  type input
  type output
  type t

  val run : state -> input list -> t -> state * output list
end

module Fsm = 
struct
  type state = Initial | Coined
  type input = InsertCoin | PushCola | PushCider | PushReturn
  type output = Coin | Cola | Cider | Nothing
  type t = ((state * input) * (state * output) ) list

  let init : t = raise TODO
  let add_rule (is:state) (i:input) (os:state) (o:output) (fsm:t) : t = 
    raise TODO
  let step (s:state) (i:input) (fsm:t) : state * output = raise TODO
end

let fsm = Fsm.init
let fsm = Fsm.add_rule Fsm.Initial Fsm.InsertCoin Fsm.Coined Fsm.Nothing fsm
let fsm = Fsm.add_rule Fsm.Initial Fsm.PushCola Fsm.Initial Fsm.Nothing fsm
let fsm = Fsm.add_rule Fsm.Initial Fsm.PushCider Fsm.Initial Fsm.Nothing fsm
let fsm = Fsm.add_rule Fsm.Initial Fsm.PushReturn Fsm.Initial Fsm.Nothing fsm
let fsm = Fsm.add_rule Fsm.Coined Fsm.InsertCoin Fsm.Coined Fsm.Coin fsm
let fsm = Fsm.add_rule Fsm.Coined Fsm.PushCola Fsm.Initial Fsm.Cola fsm
let fsm = Fsm.add_rule Fsm.Coined Fsm.PushCider Fsm.Initial Fsm.Cider fsm
let fsm = Fsm.add_rule Fsm.Coined Fsm.PushReturn Fsm.Initial Fsm.Coin fsm

let _ = Fsm.step Fsm.Initial Fsm.InsertCoin fsm
let _ = Fsm.step Fsm.Initial Fsm.PushCider fsm
let _ = Fsm.step Fsm.Coined Fsm.PushCola fsm
let _ = Fsm.step Fsm.Coined Fsm.InsertCoin fsm
let _ = Fsm.step Fsm.Coined Fsm.PushCider fsm

module FsmRunMake (F:FsmType) : FsmRunType 
  with type state = F.state 
  with type input = F.input
  with type output = F.output
  with type t = F.t =
struct 
  type state = F.state
  type input = F.input
  type output = F.output
  type t = F.t

  let rec run (s:state) (is:input list) (fsm:t) : state * output list = 
    raise TODO
end

module FsmRun = FsmRunMake (Fsm)

let result = FsmRun.run Fsm.Coined 
  [Fsm.InsertCoin;Fsm.PushCola;Fsm.InsertCoin;
   Fsm.InsertCoin;Fsm.PushCider;Fsm.PushCider] 
  fsm

let _ = 
  if result = 
    (Fsm.Initial,
     [Fsm.Coin; Fsm.Cola; Fsm.Nothing; Fsm.Coin; Fsm.Cider; Fsm.Nothing])
  then print_endline "o"
  else print_endline "x"
```

### Map ###

OCaml에서 제공하는 기본 라이브러리 Map모듈을 사용하여 유한상태기계의
규칙들을 저장하는 맵을 만들어 봅시다.  아래의 빈칸을 채우세요.

http://caml.inria.fr/pub/docs/manual-ocaml/libref/Map.html

```ocaml
exception TODO

type state = Initial | Coined
type input = InsertCoin | PushCola | PushCider | PushReturn
type output = Coin | Cola | Cider | Nothing

module StateOrder = 
struct 
  type t = raise TODO
  let compare (x:t) (y:t) = raise TODO
end

module InputOrder = 
struct 
  type t = raise TODO
  let compare (x:t) (y:t) = raise TODO
end

module Pair (M:Map.OrderedType) (N:Map.OrderedType) =
struct 
  type t = raise TODO
  let compare (x:t) (y:t) = raise TODO
end

module StateInputOrder = Pair (StateOrder) (InputOrder)
module FsmMap = Map.Make (StateInputOrder)

let fsm = FsmMap.empty
let fsm = FsmMap.add (Initial,InsertCoin) (Coined,Nothing) fsm
let fsm = FsmMap.add (Initial,PushCola) (Initial,Nothing) fsm
let fsm = FsmMap.add (Initial,PushCider) (Coined,Nothing) fsm
let fsm = FsmMap.add (Initial,PushReturn) (Coined,Nothing) fsm
let fsm = FsmMap.add (Coined,InsertCoin) (Coined,Coin) fsm
let fsm = FsmMap.add (Coined,PushCola) (Initial,Cola) fsm
let fsm = FsmMap.add (Coined,PushCider) (Initial,Cider) fsm
let fsm = FsmMap.add (Coined,PushReturn) (Initial,Coin) fsm

let result1 = FsmMap.find (Initial,InsertCoin) fsm
let result2 = FsmMap.find (Initial,PushCider) fsm
let result3 = FsmMap.find (Coined,PushCola) fsm
let result4 = FsmMap.find (Coined,InsertCoin) fsm
let result5 = FsmMap.find (Coined,PushCider) fsm

let _ =
  if result1 = (Coined, Nothing)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result2 = (Coined, Nothing)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result3 = (Initial, Cola)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result4 = (Coined, Coin)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result5 = (Initial, Cider)
  then print_endline "o"
  else print_endline "x"
```
