exception TODO

module StateOrder = 
struct 
  type t = Initial | Coined
  let compare (x:t) (y:t) : int = raise TODO
end

module InputOrder = 
struct 
  type t = InsertCoin | PushCola | PushCider | PushReturn
  let compare (x:t) (y:t) : int = raise TODO
end

module Output = 
struct 
  type t = Coin | Cola | Cider | Nothing
end

module Pair (M:Map.OrderedType) (N:Map.OrderedType) =
struct 
  type t = M.t * N.t
  let compare (x:t) (y:t) : int = raise TODO
end

module StateInputOrder = Pair (StateOrder) (InputOrder)
module FsmMap = Map.Make (StateInputOrder)

let fsm = FsmMap.empty
let fsm = FsmMap.add 
  (StateOrder.Initial,InputOrder.InsertCoin) 
  (StateOrder.Coined,Output.Nothing) 
  fsm
let fsm = FsmMap.add 
  (StateOrder.Initial,InputOrder.PushCola)
  (StateOrder.Initial,Output.Nothing)
  fsm
let fsm = FsmMap.add
  (StateOrder.Initial,InputOrder.PushCider)
  (StateOrder.Coined,Output.Nothing)
  fsm
let fsm = FsmMap.add
  (StateOrder.Initial,InputOrder.PushReturn)
  (StateOrder.Coined,Output.Nothing) 
  fsm
let fsm = FsmMap.add 
  (StateOrder.Coined,InputOrder.InsertCoin)
  (StateOrder.Coined,Output.Coin)
  fsm
let fsm = FsmMap.add 
  (StateOrder.Coined,InputOrder.PushCola)
  (StateOrder.Initial,Output.Cola) 
  fsm
let fsm = FsmMap.add
  (StateOrder.Coined,InputOrder.PushCider)
  (StateOrder.Initial,Output.Cider) 
  fsm
let fsm = FsmMap.add
  (StateOrder.Coined,InputOrder.PushReturn)
  (StateOrder.Initial,Output.Coin)
  fsm

let result1 = FsmMap.find (StateOrder.Initial,InputOrder.InsertCoin) fsm
let result2 = FsmMap.find (StateOrder.Initial,InputOrder.PushCider) fsm
let result3 = FsmMap.find (StateOrder.Coined,InputOrder.PushCola) fsm
let result4 = FsmMap.find (StateOrder.Coined,InputOrder.InsertCoin) fsm
let result5 = FsmMap.find (StateOrder.Coined,InputOrder.PushCider) fsm

let _ =
  if result1 = (StateOrder.Coined, Output.Nothing)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result2 = (StateOrder.Coined, Output.Nothing)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result3 = (StateOrder.Initial, Output.Cola)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result4 = (StateOrder.Coined, Output.Coin)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result5 = (StateOrder.Initial, Output.Cider)
  then print_endline "o"
  else print_endline "x"

module type FsmType =
sig
  type t
  val init : t
  val add_rule : StateOrder.t -> InputOrder.t -> 
    StateOrder.t -> Output.t -> t -> t
  val step : StateOrder.t -> InputOrder.t -> t -> StateOrder.t * Output.t
end

module Fsm = 
struct
  type t = (StateOrder.t * Output.t) FsmMap.t
  let init : t = FsmMap.empty
  let add_rule (is:StateOrder.t) (i:InputOrder.t) 
      (os:StateOrder.t) (o:Output.t) (fsm:t) : t =
    raise TODO
  let step (s:StateOrder.t) (i:InputOrder.t) (fsm:t) 
      : StateOrder.t * Output.t =
    raise TODO
end

module FsmRunMake (F:FsmType) =
struct 
  let rec run (s:StateOrder.t) (is:InputOrder.t list) (fsm:F.t) 
      : StateOrder.t * Output.t list = 
    raise TODO
end

module FsmRun = FsmRunMake (Fsm)

let result = FsmRun.run StateOrder.Initial
  [InputOrder.InsertCoin;InputOrder.PushCola;InputOrder.PushCider;
   InputOrder.PushReturn;InputOrder.InsertCoin;InputOrder.PushCola;
   InputOrder.PushCider;InputOrder.PushReturn] 
  fsm

let _ = 
  if result = 
    (StateOrder.Initial,
     [Output.Nothing; Output.Cola; Output.Nothing; 
      Output.Coin; Output.Nothing; Output.Cola; 
      Output.Nothing; Output.Coin])
  then print_endline "o"
  else print_endline "x"
