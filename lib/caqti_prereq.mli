(* Copyright (C) 2014--2017  Petter A. Urkedal <paurkedal@gmail.com>
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version, with the OCaml static compilation exception.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 *)

(** (internal) Prerequisites. *)

val (%) : ('b -> 'c) -> ('a -> 'b) -> 'a -> 'c
val (%>) : ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c
val (%>?) : ('a -> ('b, 'e) result) -> ('b -> ('c, 'e) result) ->
            'a -> ('c, 'e) result
val (|>?) : ('a, 'e) result -> ('a -> ('b, 'e) result) -> ('b, 'e) result

module Option : sig
  type 'a t = 'a option
  val fold : ('a -> 'b -> 'b) -> 'a option -> 'b -> 'b
end

module List : sig
  include module type of List
  val fold : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b
  val fold_r : ('a -> 'b -> ('b, 'e) result) -> 'a list -> 'b -> ('b, 'e) result
  val iter_r : ('a -> (unit, 'e) result) -> 'a list -> (unit, 'e) result
end

val finally : (unit -> unit) -> (unit -> 'a) -> 'a

val datetuple_of_iso8601 : string -> int * int * int
val iso8601_of_datetuple : int * int * int -> string

val ptime_of_rfc3339_utc : string -> (Ptime.t, string) result
val pday_of_iso8601 : string -> (int, string) result
val iso8601_of_pday : int -> (string, string) result
