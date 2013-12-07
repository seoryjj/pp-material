exception TODO

(* Project #1
 * You can assume that no three points are collinear.
 *)
module type DUSTSTORM =
sig
    type robot = string (* robot’s name *)
    type shelter = int (* shelter’s id number *)
    type location = int * int (* 화성에서의 위도와 경도 (coordinate) *)
    type robot_locs = (robot * location) list
    type shelter_locs = (shelter * location) list
    val shelterAssign: robot_locs -> shelter_locs -> (robot * shelter) list
end

module Duststorm =
struct
    type robot = string (* robot’s name *)
    type shelter = int (* shelta’s id number *)
    type location = int * int (* 화성에서의 위도와 경도 (coordinate) *)
    type robot_locs = (robot * location) list
    type shelter_locs = (shelter * location) list

    let rec shelterAssign robot_locs shelter_locs =
      raise TODO
end

