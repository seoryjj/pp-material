%{
%}
%token <int> INT
%token PLUS MINUS READ IF REPEAT LP RP EOF
%nonassoc IF REPEAT
%left PLUS 
%left MINUS
%start main
%type <T.exp> main
%%
main : 
 | exp EOF { $1 }
;
exp : 
 | INT { T.Num $1 }
 | MINUS exp { T.Minus $2 }
 | exp PLUS exp { T.Add ($1,$3) }
 | READ {T.Read }
 | IF exp exp exp { T.If ($2,$3,$4) }
 | REPEAT exp exp { T.Repeat ($2,$3) }
 | LP exp RP { $2 }
;
%%
