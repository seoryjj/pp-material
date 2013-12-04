exception Todo

type exp = 
| Num of int
| Add of exp * exp
| Minus of exp
| Read
| If of exp * exp * exp
| Repeat of exp * exp
type var = string
type tag = string
type cmd = 
| HasNum of var * int
| HasVar of var * var
| HasSum of var * var * var
| HasSub of var * var * var
| HasRead of var
| Say of var
| Goto of tag * var
| Tag of tag * cmd
| Seq of cmd * cmd

let transform (e:exp) : cmd = raise Todo
let check_exp (e:exp) : bool = raise Todo
let check_cmd (c:cmd) : bool = raise Todo

type indent = int
let string_of_indent (idt:indent) : string = String.make idt ' '
let rec string_of_exp (idt:indent) (e:exp) : string =
  (string_of_indent idt)^
    (match e with
    | Num i -> string_of_int i
    | Add (e1,e2) -> 
      "+\n"^
        (string_of_exp (idt+2) e1)^"\n"^
        (string_of_exp (idt+2) e2)
    | Minus e1 -> "-\n"^(string_of_exp (idt+2) e1)
    | Read -> "read"
    | If (e1,e2,e3) -> 
      "if\n"^
        (string_of_exp (idt+2) e1)^"\n"^
        (string_of_exp (idt+2) e2)^"\n"^
        (string_of_exp (idt+2) e3)
    | Repeat (e1,e2) -> 
      "repeat\n"^
        (string_of_exp (idt+2) e1)^"\n"^
        (string_of_exp (idt+2) e2)
    )
let pprint_exp (e:exp) : unit = print_endline (string_of_exp 0 e)

let rec string_of_cmd (c:cmd) : string = 
  match c with
  | HasNum (x,i) -> x^" has "^(string_of_int i)
  | HasVar (x,y) -> x^" has "^y
  | HasSum (x,y,z) -> x^" has "^y^"+"^z
  | HasSub (x,y,z) -> x^" has "^y^"-"^z
  | HasRead x -> x^" has read"
  | Say x -> "say "^x
  | Goto (t,x) -> "goto "^t^" on "^x
  | Tag (t,c1) -> t^": "^(string_of_cmd c1)
  | Seq (c1,c2) -> "("^(string_of_cmd c1)^" ;\n"^(string_of_cmd c2)^")"
let pprint_cmd (c:cmd) : unit = print_endline (string_of_cmd c)
