(* TA's comment:
 * 1. Implement step_tm as well as run_tm.
 *
 * 2. Functions print_tape and print_tm has different type from the direction.
 * Follow the types in this skeleton code.
 *)

module type TM = sig
  type symbol = string
  type move = Right | Left | Stay
  type todo = Erase | Write of symbol
  type state = string
  type rule = state * symbol * todo * move * state
  type ruletable = rule list
  type tape
  type tm
  (* tape part *)
  val init_tape: symbol list -> tape
  val read_tape: tape -> symbol
  val write_tape: tape -> symbol -> tape
  val move_tape_left: tape -> tape
  val move_tape_right: tape -> tape
  val print_tape: tape -> int -> string (* instead of tape -> unit *)
  (* rule table part *)
  val match_rule: state -> symbol -> ruletable -> (todo * move * state) option
  (* instead of state -> symbol -> ruletable -> todo * move * state *)
  (* main *)
  val make_tm: symbol list -> state -> ruletable -> tm
  (* instead of symbol list -> state list -> state -> ruletable -> tm *)
  val step_tm: tm -> tm option (* You should implement this. *)
  val run_tm: tm -> tm
  val print_tm: tm -> int -> string (* instead of tm -> int -> unit *)
end

module TuringMachine : TM = struct
  exception ETODO
  type tTODO = CTODO

  type symbol = string
  type move = Right | Left | Stay
  type todo = Erase | Write of symbol
  type state = string
  type rule = state * symbol * todo * move * state
  type ruletable = rule list

  type tape = tTODO (* should be replaced *)
  type tm = tTODO (* should be replaced *)

  (* tape part *)
  let init_tape: symbol list -> tape =
    fun symbols ->
    raise ETODO
          
  let read_tape: tape -> symbol =
    fun tape ->
    raise ETODO

  let write_tape: tape -> symbol -> tape =
    fun tape s ->
    raise ETODO

  let move_tape_left: tape -> tape =
    fun tape ->
    raise ETODO

  let move_tape_right: tape -> tape =
    fun tape ->
    raise ETODO

  let print_tape: tape -> int -> string = (* instead of tape -> unit *)
    fun tape size ->
    raise ETODO

  (* rule table part *)
  let match_rule: state -> symbol -> ruletable -> (todo * move * state) option =
    fun st sym rules ->
    raise ETODO


  (* main *)
  let make_tm: symbol list -> state -> ruletable -> tm =
    (* instead of symbol list -> state list -> state -> ruletable -> tm *)
    fun symbols initial_state rules ->
    raise ETODO

  let step_tm: tm -> tm option =
    fun tm ->
    raise ETODO

  let rec run_tm: tm -> tm =
    fun tm ->
    raise ETODO

  let print_tm: tm -> int -> string = (* instead of tm -> int -> unit *)
    fun tm size ->
    raise ETODO
end
