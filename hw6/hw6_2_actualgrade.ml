open CommonGrade
open Hw6_2

let _ = output (fun () -> 
                (parenize (LEAF Korea)) = "Korea")

let _ = output (fun () -> 
                (parenize (NODE (LEAF Korea, LEAF Cameroon))) = "(Korea Cameroon)")

let _ = output (fun () -> 
                (parenize (NODE (LEAF Korea,
                                 NODE (LEAF Cameroon,
                                       LEAF Poland)))) = "(Korea (Cameroon Poland))")

let _ = output (fun () -> 
                (parenize (NODE (LEAF Korea,
                                 NODE (LEAF Cameroon,
                                       NODE (LEAF Poland,
                                             LEAF Sweden))))) = "(Korea (Cameroon (Poland Sweden)))")

let _ = output (fun () -> 
  (parenize
     (NODE (NODE (NODE (LEAF Korea,
                        LEAF France),
                  LEAF Brazil),
            LEAF England))) = "(((Korea France) Brazil) England)")

let _ = output (fun () -> 
  (parenize
     (NODE (NODE (NODE (LEAF Usa,
                        LEAF Japan),
                  LEAF Nigeria),
            LEAF Cameroon))) = "(((Usa Japan) Nigeria) Cameroon)")

let _ = output (fun () -> 
  (parenize
     (NODE (NODE (NODE (LEAF Poland,
                        LEAF Portugal),
                  LEAF Italy),
            LEAF Germany))) = "(((Poland Portugal) Italy) Germany)")

let _ = output (fun () -> 
  (parenize
     (NODE (NODE (NODE (LEAF Norway,
                        LEAF Sweden),
                  LEAF Korea),
            LEAF Argentina))) = "(((Norway Sweden) Korea) Argentina)")

let _ = output (fun () -> 
  (parenize
     (NODE (NODE (NODE (LEAF Norway,
                        LEAF Sweden),
                  NODE (LEAF Korea,
                        LEAF Brazil)),
            (NODE (LEAF Argentina,
                   LEAF Usa))))) = "(((Norway Sweden) (Korea Brazil)) (Argentina Usa))")

let _ = output (fun () -> 
  (parenize
     (NODE (NODE (NODE (LEAF Norway,
                        LEAF Sweden),
                  NODE (LEAF Korea,
                        LEAF Brazil)),
            (NODE (NODE (LEAF Argentina,
                         LEAF Germany),
                   NODE (LEAF Usa,
                         LEAF Italy)))))) = "(((Norway Sweden) (Korea Brazil)) ((Argentina Germany) (Usa Italy)))")
