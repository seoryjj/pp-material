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
