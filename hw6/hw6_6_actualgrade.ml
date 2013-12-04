open CommonGrade
open Hw6_6

let _ = output (fun () -> crazy2val (ZERO NIL) = 0)

let _ = output (fun () -> crazy2val (MONE NIL) = (-1))

let _ = output (fun () -> crazy2val (MONE (ZERO (MONE NIL))) = -5)

let _ = output (fun () -> crazy2val (ZERO(ONE(MONE NIL))) = -2)

let _ = output (fun () -> crazy2val (ONE(MONE(ZERO(MONE NIL)))) = (-9))
