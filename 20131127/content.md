# 프로그래밍의 원리 실습

2013년 11월 27일 (수) 16:00-17:50 조교
[조성근](http://ropas.snu.ac.kr/~skcho),
[강지훈](http://ropas.snu.ac.kr/~jhkang)

이번 실습에서는 OCaml의 모듈과 예외 사용법을 익혀 봅시다.

## 모듈

지난 시간에 이어 모듈과 좀 더 친해집시다.  이번 시간에는 Bubble sort와
Merge sort 모듈함수를 만들어 보겠습니다.  

### Bubble sort

1. 리스트의 모든 이웃한 원소(a,b)끼리 크기를 비교한다.
  * a>b이면 a와 b를 바꾼다.
  * a<=b이면 그대로 둔다.
2. 리스트의 길이(원소의 개수)가 n일 때 n-1번만큼 1을 반복한다.

### Merge sort

1. 입력된 리스트를 균등하게 둘로 나눈다.
2. 재귀적으로 sort함수를 호출하여 나누어진 두 리스트를 각각 정렬한다.
3. 두 정렬된 리스트를 하나로 합친다.  이때 합쳐진 리스트도 정렬되어
있을 수 있도록 한다.

### 문제

모듈함수의 입력은 `OrderedType`모듈타입의 모듈이고, 출력은 `sort`함수를
가지는 모듈입니다.  각각의 sort함수를 작성하세요.

[sort.ml](sort.ml)

```ocaml
exception TODO

(* definition *)

module type OrderedType =
sig
  type t
  val compare : t -> t -> int
end

module BubbleSort (T:OrderedType) = 
struct
  type t = T.t
  let sort (x:t list) : t list = raise TODO
end

module MergeSort (T:OrderedType) = 
struct
  type t = T.t
  let sort (x:t list) : t list = raise TODO
end

(* test *)

module IntOrder = 
struct 
  type t = int
  let compare x y = x-y
end

module IntBubbleSort = BubbleSort (IntOrder)
module IntMergeSort = MergeSort (IntOrder)

let print_int_list (x:int list) : unit = 
  print_string "[";
  List.iter (fun n -> print_string ((string_of_int n)^" ")) x;
  print_endline "]"

let _ = print_int_list (IntBubbleSort.sort [5;3;2;1;6;8;9;0;7;4])
let _ = print_int_list (IntMergeSort.sort [5;3;2;1;6;8;9;0;7;4])

let rec random_list (n:int) : int list = 
  if n=0
  then []
  else (Random.int 1000000)::(random_list (n-1))

let _ =
  let s_time = Sys.time () in
  let _ = IntBubbleSort.sort (random_list 3000) in
  let e_time = Sys.time () in
  print_endline 
    ("BubbleSort (4000): "^(string_of_float (e_time -. s_time))^"sec")

let _ = 
  let s_time = Sys.time () in
  let _ = IntMergeSort.sort (random_list 30000) in
  let e_time = Sys.time () in
  print_endline 
    ("MergeSort (40000): "^(string_of_float (e_time -. s_time))^"sec")
```

## 예외

두 번째 주제는 예외처리입니다.  다음의 예는 예외처리를 제대로 하지 않은
안전하지 않은 함수사용과 예외처리를 한 안전한 함수사용을 보여줍니다.

```ocaml
(* unsafe *)
let mydiv (x:string) (y:string) : int = 
  (int_of_string x) / (int_of_string y)
let _ = mydiv "3" "zero"
let _ = mydiv "3" "0"

(* safe *)
let mydiv (x:string) (y:string) : int = 
  try 
    (int_of_string x) / (int_of_string y)
  with
  | Division_by_zero -> 0
  | Failure "int_of_string" -> 0
let _ = mydiv "3" "zero"
let _ = mydiv "3" "0"
```

예외처리 구문의 문법은 `match ... with`의 그것과 비슷하여, 위와 같이
여러가지 예외에 대해 구분되는 처리가 가능합니다.

### 문제

다음의 함수 `hd`, `nth`, `find`는 예외처리를 제대로 하지 않아 실행 도중
예외를 발생시키며 프로그램을 종료시킵니다.  프로그램이 종료되지 않고
가장 마지막 명령어가 실행되어 `o`가 출력되도록 `try ... with` 구문을
추가하세요.

`List`모듈과 `Map`모듈의 각 함수가 발생시킬 수 있는 예외들에 대해서는
다음 페이지를 참고하세요:
[Module List](http://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html),
[Functor Map.Make](http://caml.inria.fr/pub/docs/manual-ocaml/libref/Map.Make.html).

[exception_ex.ml](exception_ex.ml)

```ocaml
let hd (x:int list) : int = 
  List.hd x
let _ = hd [1;2;3]
let _ = hd []

let nth (x:int list) (n:int) : int = 
  List.nth x n 
let _ = nth [1;2;3] 1
let _ = nth [1;2;3] 5
let _ = nth [1;2;3] (-1)

module IntOrder =
struct
  type t = int
  let compare (x:t) (y:t) : int = x-y
end
module IntMap = Map.Make (IntOrder)

let m = IntMap.empty
let m = IntMap.add 1 "one" m
let m = IntMap.add 2 "two" m
let m = IntMap.add 4 "four" m
let m = IntMap.add 5 "five" m

let find (i:int) (m:string IntMap.t) : string = 
  IntMap.find i m
let _ = find 1 m
let _ = find 3 m
let _ = find 5 m

let _ = print_endline "o"
```
