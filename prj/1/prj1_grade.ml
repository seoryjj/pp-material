open CommonGrade

let robots = [("r1", (1, 1)); ("r2", (1, 99))]
let shelters = [(3, (99, 99)); (4, (99, 1))]

let _ =
  output
    (fun () ->
     let result = Prj1.Duststorm.shelterAssign robots shelters in
     (result = [("r1", 4); ("r2", 3)]) ||
     (result = [("r2", 3); ("r1", 4)]))
