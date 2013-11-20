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

module type NumType = 
sig
  type t
  val add : t -> t -> t
  val to_string : t -> string
end

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
