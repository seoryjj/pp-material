module type FsmType =
sig
  type state
  type input
  type output
  val step : state -> input -> state * output
end

module type FsmRunType =
sig
  type state
  type input
  type output
  val run : state -> input list -> state * output list
end

module Fsm = 
struct
  type state = Initial | Coined
  type input = InsertCoin | PushCola | PushCider | PushReturn
  type output = Coin | Cola | Cider | Nothing

  let step (s:state) (i:input) : state * output =
    match s,i with
    | Initial,InsertCoin -> (Coined,Nothing)
    | Initial,_ -> (Initial,Nothing)
    | Coined,InsertCoin -> (Coined,Coin)
    | Coined,PushCola -> (Initial,Cola)
    | Coined,PushCider -> (Initial,Cider)
    | Coined,PushReturn -> (Initial,Coin)
end

let _ = Fsm.step Fsm.Initial Fsm.InsertCoin
let _ = Fsm.step Fsm.Coined Fsm.InsertCoin
let _ = Fsm.step Fsm.Coined Fsm.PushCola

module FsmRunMake (F:FsmType) : FsmRunType 
  with type state = F.state 
  with type input = F.input
  with type output = F.output =
struct 
  type state = F.state
  type input = F.input
  type output = F.output
  let rec run (s:state) (is:input list) : state * output list = 
    match is with
    | [] -> (s,[])
    | hd::tl -> 
      let (hd_state,hd_output) = F.step s hd in
      let (tl_state,tl_outputs) = run hd_state tl in
      (tl_state, hd_output::tl_outputs)
end

module FsmRun = FsmRunMake (Fsm)

let _ = FsmRun.run Fsm.Initial [Fsm.InsertCoin;Fsm.InsertCoin;Fsm.PushCola]
