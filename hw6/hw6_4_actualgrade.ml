open CommonGrade
open Hw6_4

let _ = output (fun () -> (eval FALSE) = false)

let _ = output (fun () -> (eval (ANDALSO (FALSE,TRUE))) = false)

let _ = output (fun () -> (eval (ORELSE (FALSE,TRUE)))
 = true)
               
let _ = output (fun () -> (eval (ANDALSO ((NOT (ANDALSO (FALSE, FALSE))), (ANDALSO ((NOT (ANDALSO (TRUE, FALSE))), ((ANDALSO ((NOT (ANDALSO (FALSE, TRUE))), (ANDALSO (TRUE, TRUE)))))))))) = true)
               
let _ = output (fun () -> (eval (ANDALSO ((NOT (ORELSE (FALSE, FALSE))), (ANDALSO ((ORELSE (TRUE, FALSE)), (ANDALSO ((ORELSE (FALSE, TRUE)), (ORELSE (TRUE, TRUE))))))))) = true)
               
let _ = output (fun () -> (eval (IMPLY ((ORELSE ((ANDALSO (TRUE, FALSE)), FALSE)),(NOT (ANDALSO ((ORELSE (TRUE, FALSE)), FALSE)))))) = true)
               
let _ = output (fun () -> (eval (IMPLY ((NOT (ANDALSO ((ORELSE (TRUE, FALSE)), FALSE))), (ORELSE ((ANDALSO (TRUE, FALSE)), FALSE))))) = false)
               
let _ = output (fun () -> (eval (LESS ((PLUS ((NUM 1), (NUM 2))),(MINUS ((NUM 9), (NUM 5)))))) = true)
               
let _ = output (fun () -> (eval (IMPLY ((ANDALSO ((LESS ((NUM 2), (NUM 5))) , FALSE)) , (ORELSE ((LESS ((NUM 1) , (NUM 4))), FALSE))))) = true)
               
let _ = output (fun () -> (eval (IMPLY ((ORELSE ((NOT (ANDALSO (TRUE, FALSE))), (ORELSE ((NOT (ANDALSO (TRUE, FALSE))), ((ANDALSO ((NOT (ANDALSO (FALSE, TRUE))), (ANDALSO (TRUE, TRUE))))))))), (LESS ((PLUS ((NUM 235), (NUM 190))),(MINUS ((NUM 340), (NUM 5)))))))) = false)
