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
