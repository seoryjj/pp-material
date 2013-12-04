%{
%}
%token <int> INT
%token <string> ID
%token HAS PLUS MINUS READ SAY GOTO ON SEMICOLON COLON LP RP EOF
%right SEMICOLON
%nonassoc COLON
%start main
%type <T.cmd> main
%%
main : 
 | cmd EOF { $1 }
;
cmd : 
 | ID HAS INT { T.HasNum ($1,$3) }
 | ID HAS ID { T.HasVar ($1,$3) }
 | ID HAS ID PLUS ID { T.HasSum ($1,$3,$5) }
 | ID HAS ID MINUS ID { T.HasSub ($1,$3,$5) }
 | ID HAS READ { T.HasRead $1 }
 | SAY ID { T.Say $2 }
 | GOTO ID ON ID { T.Goto ($2,$4) }
 | ID COLON cmd { T.Tag ($1,$3) }
 | cmd SEMICOLON cmd { T.Seq ($1,$3) }
 | LP cmd RP { $2 }
;
%%
