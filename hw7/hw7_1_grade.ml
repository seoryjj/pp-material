open CommonGrade
open Hw7_1

(* Tape *)
let _ = print_endline "Tape"

let tape1 = TuringMachine.init_tape ["a";"b"]
let tape2 = TuringMachine.move_tape_left tape1
let tape3 = TuringMachine.move_tape_left tape2
let tape4 = TuringMachine.move_tape_right tape3
let tape5 = TuringMachine.move_tape_right tape4
let tape6 = TuringMachine.move_tape_right tape5
let tape7 = TuringMachine.write_tape tape6 "c"

let _ = output (fun () -> "-.-.a.b.-" = (TuringMachine.print_tape tape1 2))
let _ = output (fun () -> "-.a.b.-.-" = (TuringMachine.print_tape tape2 2))
let _ = output (fun () -> "a.b.-.-.-" = (TuringMachine.print_tape tape3 2))
let _ = output (fun () -> "-.a.b.-.-" = (TuringMachine.print_tape tape4 2))
let _ = output (fun () -> "-.-.a.b.-" = (TuringMachine.print_tape tape5 2))
let _ = output (fun () -> "-.-.-.a.b" = (TuringMachine.print_tape tape6 2))
let _ = output (fun () -> "-.-.c.a.b" = (TuringMachine.print_tape tape7 2))

let _ = output (fun () -> "a" = (TuringMachine.read_tape tape1))
let _ = output (fun () -> "b" = (TuringMachine.read_tape tape2))
let _ = output (fun () -> "c" = (TuringMachine.read_tape tape7))

(* Rule table *)
let _ = print_endline "Rule table"

let table = 
  [("1","a",TuringMachine.Write "d",TuringMachine.Right,"2");
   ("2","b",TuringMachine.Write "e",TuringMachine.Right,"3");
   ("3","-",TuringMachine.Write "f",TuringMachine.Left,"4");
   ("4","e",TuringMachine.Write "g",TuringMachine.Left,"5");
   ("5","d",TuringMachine.Write "h",TuringMachine.Left,"6");
   ("6","-",TuringMachine.Write "i",TuringMachine.Stay,"7")]

let _ = output (fun () -> 
  (TuringMachine.Write "d",TuringMachine.Right,"2") = 
    TuringMachine.match_rule "1" "a" table
)
let _ = output (fun () -> 
  (TuringMachine.Write "e",TuringMachine.Right,"3") = 
    TuringMachine.match_rule "2" "b" table
)
let _ = output (fun () -> 
  (TuringMachine.Write "f",TuringMachine.Left,"4") = 
    TuringMachine.match_rule "3" "-" table
)
let _ = output (fun () -> 
  (TuringMachine.Write "g",TuringMachine.Left,"5") = 
    TuringMachine.match_rule "4" "e" table
)
let _ = output (fun () -> 
  (TuringMachine.Write "h",TuringMachine.Left,"6") = 
    TuringMachine.match_rule "5" "d" table
)
let _ = output (fun () -> 
  (TuringMachine.Write "i",TuringMachine.Stay,"7") = 
    TuringMachine.match_rule "6" "-" table
)

(* Turaing machine *)
let _ = print_endline "Turing machine"

let tm1 = TuringMachine.make_tm ["a";"b"] "1" table
let tm2 = TuringMachine.step_tm tm1
let tm3 = TuringMachine.step_tm tm2
let tm4 = TuringMachine.step_tm tm3
let tm5 = TuringMachine.step_tm tm4
let tm6 = TuringMachine.step_tm tm5
let tm7 = TuringMachine.step_tm tm6
let tm8 = TuringMachine.step_tm tm7
let tm9 = TuringMachine.run_tm tm1
let tm10 = TuringMachine.run_tm tm8

let _ = output (fun () -> "-.-.a.b.-" = TuringMachine.print_tm tm1 2)
let _ = output (fun () -> "-.d.b.-.-" = TuringMachine.print_tm tm2 2)
let _ = output (fun () -> "d.e.-.-.-" = TuringMachine.print_tm tm3 2)
let _ = output (fun () -> "-.d.e.f.-" = TuringMachine.print_tm tm4 2)
let _ = output (fun () -> "-.-.d.g.f" = TuringMachine.print_tm tm5 2)
let _ = output (fun () -> "-.-.-.h.g" = TuringMachine.print_tm tm6 2)
let _ = output (fun () -> "-.-.i.h.g" = TuringMachine.print_tm tm7 2)

(* If no rule is applicable, just do nothing. *)

let _ = output (fun () -> "-.-.i.h.g" = TuringMachine.print_tm tm8 2)

let _ = output (fun () -> "-.-.i.h.g" = TuringMachine.print_tm tm9 2)
let _ = output (fun () -> "-.-.i.h.g" = TuringMachine.print_tm tm10 2)
