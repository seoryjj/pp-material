open CommonGrade
open Hw6_3

let _ = output (fun () -> 
                (drop (NODE (LEAF Korea,
                                 NODE (LEAF Cameroon,
                                       LEAF Poland))) Poland) = "(Korea Cameroon)")

let _ = output (fun () -> 
                (drop (NODE (LEAF Korea,
                                 NODE (LEAF Cameroon,
                                       LEAF Poland))) Korea) = "(Cameroon Poland)")

let _ = output (fun () -> 
                (drop (NODE (LEAF Korea,
                                 NODE (LEAF Cameroon,
                                       NODE (LEAF Poland,
                                             LEAF Sweden)))) Poland) = "(Korea (Cameroon Sweden))")

let _ = output (fun () -> 
  (drop
     (NODE (NODE (NODE (LEAF Korea,
                        LEAF France),
                  LEAF Brazil),
            LEAF England)) Brazil) = "((Korea France) England)")

let _ = output (fun () -> 
  (drop
     (NODE (NODE (NODE (LEAF Usa,
                        LEAF Japan),
                  LEAF Nigeria),
            LEAF Cameroon)) Usa) = "((Japan Nigeria) Cameroon)")

let _ = output (fun () -> 
  (drop
     (NODE (NODE (NODE (LEAF Poland,
                        LEAF Portugal),
                  LEAF Italy),
            LEAF Germany)) Germany) = "((Poland Portugal) Italy)")

let _ = output (fun () -> 
  (drop
     (NODE (NODE (NODE (LEAF Norway,
                        LEAF Sweden),
                  LEAF Korea),
            LEAF Argentina)) Sweden) = "((Norway Korea) Argentina)")

let _ = output (fun () -> 
  (drop
     (NODE (NODE (NODE (LEAF Norway,
                        LEAF Sweden),
                  NODE (LEAF Korea,
                        LEAF Brazil)),
            (NODE (LEAF Argentina,
                   LEAF Usa)))) Argentina) = "(((Norway Sweden) (Korea Brazil)) Usa)")

let _ = output (fun () -> 
  (drop
     (NODE (NODE (NODE (LEAF Norway,
                        LEAF Sweden),
                  NODE (LEAF Korea,
                        LEAF Brazil)),
            (NODE (NODE (LEAF Argentina,
                         LEAF Germany),
                   NODE (LEAF Usa,
                         LEAF Italy))))) Norway) = "((Sweden (Korea Brazil)) ((Argentina Germany) (Usa Italy)))")

let _ = output (fun () ->
  (drop (NODE (NODE (NODE (LEAF Korea, LEAF France), LEAF Brazil), LEAF England)) England) =
  "((Korea France) Brazil)")
