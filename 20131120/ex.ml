exception TODO

module State = 
struct 
  type t = Initial | Coined
  let compare (x:t) (y:t) : int = raise TODO
end

module Input = 
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

module StateInput = Pair (State) (Input)
module FsmMap = Map.Make (StateInput)

let fsm = FsmMap.empty
let fsm = FsmMap.add 
  (State.Initial,Input.InsertCoin) (State.Coined,Output.Nothing) fsm
let fsm = FsmMap.add 
  (State.Initial,Input.PushCola) (State.Initial,Output.Nothing) fsm
let fsm = FsmMap.add
  (State.Initial,Input.PushCider) (State.Coined,Output.Nothing) fsm
let fsm = FsmMap.add
  (State.Initial,Input.PushReturn) (State.Coined,Output.Nothing) fsm
let fsm = FsmMap.add 
  (State.Coined,Input.InsertCoin) (State.Coined,Output.Coin) fsm
let fsm = FsmMap.add 
  (State.Coined,Input.PushCola) (State.Initial,Output.Cola) fsm
let fsm = FsmMap.add
  (State.Coined,Input.PushCider) (State.Initial,Output.Cider) fsm
let fsm = FsmMap.add 
  (State.Coined,Input.PushReturn) (State.Initial,Output.Coin) fsm

let result1 = FsmMap.find (State.Initial,Input.InsertCoin) fsm
let result2 = FsmMap.find (State.Initial,Input.PushCider) fsm
let result3 = FsmMap.find (State.Coined,Input.PushCola) fsm
let result4 = FsmMap.find (State.Coined,Input.InsertCoin) fsm
let result5 = FsmMap.find (State.Coined,Input.PushCider) fsm

let _ =
  if result1 = (State.Coined, Output.Nothing)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result2 = (State.Coined, Output.Nothing)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result3 = (State.Initial, Output.Cola)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result4 = (State.Coined, Output.Coin)
  then print_endline "o"
  else print_endline "x"
let _ =
  if result5 = (State.Initial, Output.Cider)
  then print_endline "o"
  else print_endline "x"

module type FsmType =
sig
  type t
  val init : t
  val add_rule : State.t -> Input.t -> State.t -> Output.t -> t -> t
  val step : State.t -> Input.t -> t -> State.t * Output.t
end

module Fsm = 
struct
  type t = (State.t * Output.t) FsmMap.t
  let init : t = FsmMap.empty
  let add_rule (is:State.t) (i:Input.t) (os:State.t) (o:Output.t) (fsm:t) : t =
    raise TODO
  let step (s:State.t) (i:Input.t) (fsm:t) : State.t * Output.t =
    raise TODO
end

module FsmRunMake (F:FsmType) =
struct 
  let rec run (s:State.t) (is:Input.t list) (fsm:F.t) 
      : State.t * Output.t list = 
    raise TODO
end

module FsmRun = FsmRunMake (Fsm)

let result = FsmRun.run State.Initial
  [Input.InsertCoin; Input.PushCola; Input.PushCider; Input.PushReturn;
   Input.InsertCoin; Input.PushCola; Input.PushCider; Input.PushReturn] 
  fsm

let _ = 
  if result = 
    (State.Initial,
     [Output.Nothing; Output.Cola; Output.Nothing; Output.Coin;
      Output.Nothing; Output.Cola; Output.Nothing; Output.Coin])
  then print_endline "o"
  else print_endline "x"
