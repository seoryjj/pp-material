exception TODO

module type MARKOV =
sig
    type matrix
    val row: float list -> matrix
    val column: float list -> matrix
    val add_row: float list -> matrix -> matrix
    val add_column: float list -> matrix -> matrix
    val size: matrix -> int * int (* numbers of columns and rows *)
    val ij: matrix -> int -> int -> float
    (*
    Given a Markov matrix and an initial column,
    markov_limit returns the limit of the Markov chain.
    *)
    val markov_limit: matrix -> matrix -> matrix
end

module Markov : MARKOV =
struct
    type matrix =
      | MATRIXTODO

    let row flist =
      raise TODO
    let column flist =
      raise TODO
    let add_row flist mat =
      raise TODO
    let add_column flist mat =
      raise TODO
    let size mat = (* numbers of columns and rows *)
      raise TODO
    let ij mat i j = (* i = column index, j = row index *)
      raise TODO
    let markov_limit mat initial_mat =
      raise TODO
end

(* you may find this function useful in debugging. *)
let matrix_printer mat =
  let (cs,rs) = Markov.size mat in
  for j=0 to rs-1 do
    for i=0 to cs-1 do
      print_string "\t";
      (print_float (Markov.ij mat i j))
    done;
    print_newline ()
  done;
  print_newline ()
