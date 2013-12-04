(* definition *)

module type OrderedType =
sig
  type t
  val compare : t -> t -> int
end

module BubbleSort (T:OrderedType) = 
struct
  type t = T.t

  let rec sort_once (x:t list) : t list = 
    match x with
    | [] -> []
    | [a] -> [a]
    | a::b::tl -> 
      if T.compare a b > 0
      then b::(sort_once (a::tl))
      else a::(sort_once (b::tl))

  let rec sort_rec (x:t list) (n:int) : t list =
    if n=0
    then x
    else sort_rec (sort_once x) (n-1)

  let sort (x:t list) : t list = 
    let leng = List.length x in
    sort_rec x (leng-1)
end

module MergeSort (T:OrderedType) = 
struct
  type t = T.t

  let rec divide (x:t list) : t list * t list =
    match x with
    | [] -> ([],[])
    | [a] -> ([a],[])
    | a::b::tl -> 
      let (tl1,tl2) = divide tl in
      (a::tl1,b::tl2)

  let rec merge (x:t list) (y:t list) : t list = 
    match x,y with
    | [],_ -> y
    | _,[] -> x
    | a::xtl,b::ytl -> 
      if T.compare a b > 0 
      then b::(merge (a::xtl) ytl)
      else a::(merge xtl (b::ytl))

  let rec sort (x:t list) : t list = 
    match x with
    | [] -> []
    | [a] -> [a]
    | _ ->
      let (a,b) = divide x in
      merge (sort a) (sort b)
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
    ("BubbleSort (3000): "^(string_of_float (e_time -. s_time))^"sec")

let _ = 
  let s_time = Sys.time () in
  let _ = IntMergeSort.sort (random_list 3000) in
  let e_time = Sys.time () in
  print_endline 
    ("MergeSort (3000): "^(string_of_float (e_time -. s_time))^"sec")
