module type SMATCH = sig
  type c =
    | Zero
    | One
    | Two
    | Mult of c * c
    | Sum of c * c
    | Opt of c (* c? *)
    | Star of c (* c* *)

  val smatch: string -> c -> bool
end

module Smatch : SMATCH = struct
  exception ETODO

  type c =
    | Zero
    | One
    | Two
    | Mult of c * c
    | Sum of c * c
    | Opt of c (* c? *)
    | Star of c (* c* *)

  let smatch: string -> c -> bool =
    fun str code ->
    raise ETODO
end
