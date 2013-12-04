open CommonGrade
open Prj4
open Bouviton

let test_genrule = [(A,[A;B]);(B,[A]);(C,[]);(D,[])]
let test_delrule = [[A;A]]
let test_rule = (test_genrule,test_delrule)

let _ = print_endline "pprint"
let _ = output (fun () -> pprint A test_rule 0 = "A")
let _ = output (fun () -> pprint A test_rule 1 = "AB")
let _ = output (fun () -> pprint A test_rule 2 = "ABA")
let _ = output (fun () -> pprint A test_rule 3 = "ABB")
let _ = output (fun () -> pprint A test_rule 4 = "AB")

let _ = print_endline "valid"
let _ = output (fun () -> valid A test_rule [A;B;B] = true)
let _ = output (fun () -> valid A test_rule [A;B;C] = false)
let _ = output (fun () -> valid A (test_genrule,[]) [A;B;A;A;B] = true)
let _ = output (fun () -> valid A (test_genrule,[]) [A;B;A;A;C] = false)
