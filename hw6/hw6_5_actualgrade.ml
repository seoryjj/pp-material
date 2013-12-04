open CommonGrade
open Hw6_5

let rec ta_diff exp var =
  match exp with
  | CONST i -> CONST 0
  | VAR s -> if s = var then CONST 1 else CONST 0
  | POWER (s, i) -> if s = var then TIMES (CONST i::POWER (s, i-1)::[]) else CONST 0
  | TIMES [] -> CONST 0
  | TIMES (h::[]) -> diff h var
  | TIMES (h::t) ->
    let h' = diff h var in
    let t' = diff (TIMES t) var in
    SUM [(TIMES (h'::t));(TIMES [h;t'])]
  | SUM [] -> CONST 0
  | SUM (h::[]) -> diff h var
  | SUM (h::t) -> 
    let h' = diff h var in
    let t' = diff (SUM t) var in
    SUM [h';t']
let rec eval exp =
  match exp with
  | CONST i -> i
  | VAR "x" -> 23
  | VAR "y" -> -7
  | VAR _ -> 2
  | POWER (s,i) -> 
    if i=0 then 1 else (eval (VAR s)) * (eval (POWER (s, i-1)))
  | TIMES (hd::tl) -> (eval hd)*(eval (TIMES tl))
  | TIMES [] -> 1
  | SUM (hd::tl) -> (eval hd)+(eval (SUM tl))
  | SUM [] -> 0

let check exp var =
  ((eval (diff exp var)) = (eval (ta_diff exp var)))

let _ = output (fun () -> (check (CONST 0) "a"))
let _ = output (fun () -> (check (VAR "x")) "x")
let _ = output (fun () -> (check (POWER ("x", 3)) "x"))
let _ = output (fun () -> (check (POWER ("x", 3)) "y"))
let _ = output (fun () -> (check (SUM [CONST 1; VAR "x"]) "x"))
let _ = output (fun () -> (check (TIMES [POWER ("x", 3); VAR ("x"); CONST 2]) "x"))
let _ = output (fun () -> (check (TIMES[VAR "x"; POWER ("x", 3); POWER("x", 4)]) "x"))
let _ = output (fun () -> (check (SUM [VAR "x"; POWER ("x", 3); POWER("x", 4)]) "x"))
let _ = output (fun () -> (check (SUM[ TIMES [VAR "x"; POWER("y", 2)]; TIMES [VAR "y"; CONST 2]]) "y"))
let _ = output (fun () -> (check (SUM[ TIMES [CONST 7; VAR "x"; POWER("y", 2)]; TIMES [POWER ("x", 2); CONST 2]; TIMES[CONST 8;VAR "x"; POWER("y",4) ] ]) "y"))
