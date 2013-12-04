{ open Cmd_parser }
let id = ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_' '\'']*
rule token = parse 
| [' ' '\t' '\n'] { token lexbuf }
| "has" { HAS }
| "read" { READ }
| "say" { SAY }
| "goto" { GOTO }
| "on" { ON }
| id as x { ID x }
| ['0'-'9']+ as i { INT (int_of_string i) }
| '+' { PLUS }
| '-' { MINUS }
| ';' { SEMICOLON }
| ':' { COLON }
| "(" { LP }
| ")" { RP }
| eof { EOF }
{ }
