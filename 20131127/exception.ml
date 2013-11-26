(* unsafe *)
let mydiv (x:string) (y:string) : int = 
  (int_of_string x) / (int_of_string y)
let _ = mydiv "3" "zero"
let _ = mydiv "3" "0"

(* safe *)
let mydiv (x:string) (y:string) : int = 
  try 
    (int_of_string x) / (int_of_string y)
  with
  | Division_by_zero -> 0
  | Failure "int_of_string" -> 0
let _ = mydiv "3" "zero"
let _ = mydiv "3" "0"
