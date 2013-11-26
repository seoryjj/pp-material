(* Make the functions to be safe by adding proper try...with
   constructs. *)

let print_nth (x:int list) (n:int) : unit = 
  try 
    print_endline ("nth element is "^(string_of_int (List.nth x n)))
  with 
    ...

let _ = print_nth [1;2;3] 1
let _ = print_nth [1;2;3] 5
let _ = print_nth [1;2;3] (-1)

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

let print_find (i:int) (m:string IntMap.t) : unit = 
  try
    print_endline (IntMap.find i m)
  with 
    ...

let _ = print_find 1 m
let _ = print_find 3 m
let _ = print_find 5 m

let _ = print_endline "o"
