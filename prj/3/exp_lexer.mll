{ open Exp_parser }
rule token = parse 
| [' ' '\t' '\n'] { token lexbuf }
| ['0'-'9']+ as i { INT (int_of_string i) }
| '+' { PLUS }
| '-' { MINUS }
| "read" { READ }
| "if" { IF }
| "repeat" { REPEAT }
| "(" { LP }
| ")" { RP }
| eof { EOF }
{ }
