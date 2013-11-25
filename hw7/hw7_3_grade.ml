open CommonGrade
open Hw7_3

let _ = output (fun () -> 
  true = 
    (Smatch.smatch "11"
       (Smatch.Mult
          (Smatch.Mult (Smatch.One,Smatch.Star Smatch.Zero),
           Smatch.Opt Smatch.One)))
)

let _ = output (fun () -> 
  false = 
    (Smatch.smatch "11"
       (Smatch.Mult
          (Smatch.Star (Smatch.Mult (Smatch.One,Smatch.Zero)),
           Smatch.One)))
)
