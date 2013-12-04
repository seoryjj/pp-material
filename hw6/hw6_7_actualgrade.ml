open CommonGrade
open Hw6_7

let rec ta_crazy2val v =	
	match v with
	| NIL -> 0
	| ZERO p -> 2 * (ta_crazy2val p)
	| ONE p -> 2 * (ta_crazy2val p) + 1
	| MONE p -> 2 * (ta_crazy2val p) - 1

let check (a, b) = 
	(ta_crazy2val (crazy2add a b)) = ((ta_crazy2val a) + (ta_crazy2val b))

let _ = output (fun () -> check (ZERO NIL, ZERO NIL))
let _ = output (fun () -> check (MONE NIL, MONE NIL))
let _ = output (fun () -> check (ONE (MONE NIL), (ONE NIL)))
let _ = output (fun () -> check (MONE(ONE(ONE NIL)), MONE(ONE(ONE NIL))))
let _ = output (fun () -> check (ONE (ZERO (MONE (ZERO NIL))), ONE (ONE (ONE NIL))))
