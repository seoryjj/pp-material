open CommonGrade
open Hw7_3

let _ = output (fun () -> 
  true = 
    (Smatch.smatch 
       "11" =
        Smatch.Mult
          (Smatch.Mul (Smult.One,Smult.Star Smult.Zero),
           Smatch.Opt Smult.One))
)

let _ = output (fun () -> 
  false = 
    (Smatch.smatch 
       "11" =
        Smatch.Mult
          (Smult.Star (Smatch.Mult (Smult.One,Smult.Zero)),
           Smult.One))
)
