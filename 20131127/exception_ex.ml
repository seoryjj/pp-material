(* Make the functions to be safe by adding proper try...with
   constructs. *)

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
