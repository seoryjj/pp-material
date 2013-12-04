exception Todo

module type BOUVITON =
sig
  type symbol = A | B | C | D
  type start = symbol
  type genrule = (symbol * symbol list) list
  type delrule = (symbol list) list
  type rule = genrule * delrule
  val pprint : start -> rule -> int -> string
  val valid : start -> rule -> symbol list -> bool
end

module Bouviton : BOUVITON =
struct
  type symbol = A | B | C | D
  type start = symbol
  type genrule = (symbol * symbol list) list
  type delrule = (symbol list) list
  type rule = genrule * delrule

  let pprint (s:start) (r:rule) (x:int) : string = raise Todo
  let valid (s:start) (r:rule) (sl:symbol list) : bool = raise Todo
end
