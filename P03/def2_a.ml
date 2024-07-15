let p x = 2. *. asin 1. *. x;;
(* let p = function x -> 2. *. asin 1. *. x;; *)

let area x = asin 1. *. x *. x;;
(* let area = function x -> asin 1. *. x *. x;; *)

let absf x = if x < 0. then (-1.)*.x else x;;

let even n = n mod 2 = 0;;

let next3 a = a + ((3 - a mod 3)  mod 3);;

let is_a_letter b = if( b>= 'A' && b<= 'Z' || b>= 'a' && b<= 'z') then true else false;;

let string_of_bool c = 
	if( c = true) then "verdadero" else "falso";;
