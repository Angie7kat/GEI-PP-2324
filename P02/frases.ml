(* x - y;; 
Error: Unbound value x 
No se puede ejecutar la resta porque ni x ni y tienen asignado ningún valor. *)

let x =  1;; 
(* val x : int = 1
Asigna a x el valor 1 de forma global. *)

(* x - y;; 
Error: Unbound value y 
Ahora x vale 1 ya que lo hemos definido previamente de forma global pero seguimos necesitando definir el valor de y para poder hacer la resta. *)

let y = 2;; 
(* val y : int = 2
Asigna a y el valor 2 de forma global. *)

x - y;; 
(* - : int = -1 
Ahora la resta si se puede ejecutar porque x e y tienen un valor asignado. *)

let x = y in x - y;; 
(* - : int = 0
De forma temporal para la resta que se muestra a continuación y tendrá el mismo valor que x entonces 1-1 = 0. *)

x - y;; 
(*- : int = -1
La resta sigue dando -1, en la anterior linea y valía 1 de forma temporal, la y global tiene el valor 2. *)

(*z;;
Error: Unbound value z
Error z no tiene ningún valor. *)

let z = x + y;;
(*val z : int = 3
z = 1 + 2. *)

z;;
(* - : int = 3
Muestra el valor de z. *)

let x = 5;;
(*val x : int = 5
Ahora x pasa a valer 5. *)

x + y;;
(*- : int = 7
Como ahora x es 5 x + y es igual a 7. *)

z;;
(*- : int = 3
z sigue valiendo 3 porque z se asigna al resultado de la expresión de x + y cuando x valía 1 no a la expresión en si, por tanto modificar el valor de x no modifica z. *)

let y = 5 in x + y;;
(* - : int = 10
Le damos el valor de 5 a y de forma temporal x + y = 10. *)

x + y;;
(*- : int = 7
x sigue valiendo 5 e y sigue valiendo 2*)
 
let x = x + y in let y = x * y in x + y + z;;
(*- : int = 24
De forma temporal x es x + y e y es x * y para resolver x + y + z. *)

x + y + z;;
(*- : int = 10
5 + 2 + 3. *)

function x -> 2 * x;;
(*- : int -> int = <fun> *)

(function x -> 2 * x) (2 + 1);;
(*- : int = 6
2 * (2 + 1) *)

(function x -> 2 * x) 2 + 1;;
(*- : int = 5
2 * 2 + 1 *)

let f = function x -> 2 * x;;
(*val f : int -> int = <fun> *)

f;;
(*- : int -> int = <fun> *)

f (2 + 1);;
(*- : int = 6 *)

f 2 + 1;;
(* - : int = 5 *)

f x;;
(*- : int = 10*)

let x = 100;; 
(*val x : int = 100*)

f x;;
(*- : int = 200*)

let m = 1000;;
(*val m : int = 1000 *)

let g = function x -> x + m;;
(*val g : int -> int = <fun> *) 

g;;
(*- : int -> int = <fun>
G ahora es una función. *)

g 3;;
(*- : int = 1003
suma 3 + 1000 *)

(*g 3.0;;
Error: This expression has type float but an expression was expected of type int
La función maneja int pero el valor es tipo float, error de tipos *)

let m = 7;;
(*val m : int = 7 *)

g 3;;
(*- : int = 1003 
3 + 1000 *)

let istrue = function true -> true;;
(* Warning 8 [partial-match]: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched: false
val istrue : bool -> bool = <fun>
Damos el nombre istrue a la siguiente función la cual salta un warning porque útiliza un bool, bool tiene dos valores true y false, en la función no definimos ningún valor para false por lo que salta un warning. *)

istrue;;
(*- : bool -> bool = <fun> *)

istrue (1 < 2);;
(*- : bool = true *)

istrue (2 < 1);;
(*Exception: Match_failure ("//toplevel//", 1, 13).
Como no definimos en la función el caso false, salta una excepción. *)

(*istrue 0;;
Error: This expression has type int but an expression was expected of type bool.
Da error de tipos porque recibe un int en vez de un bool. *)

let iscero_v1 = function 0 -> true;;
(*Warning 8 [partial-match]: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:1
val iscero_v1 : int -> bool = <fun> *)

iscero_v1 0;;
(*- : bool = true
Esta función pasa de int a bool por lo que ahora no salta un error. *)

(*iscero_v1 0.;;
Error: This expression has type float but an expression was expected of type int
Error de tipos introduce un float cuando deber recibir un int. *)

iscero_v1 1;;
(*Exception: Match_failure ("//toplevel//", 1, 16).
El 1 no está contemplado en la función, excepción. *)

let iscero_v2 = function 0 -> true | _ -> false;;
(*val iscero_v2 : int -> bool = <fun> *)

iscero_v2 0;;
(*- : bool = true *)

iscero_v2 1;;
(*- : bool = false *)

(*iscero_v2 0.;;
Error: This expression has type float but an expression was expected of type int
Error de tipos, debe entrar un int. *)

let all_to_true = function true -> true | false -> true;;
(*val all_to_true : bool -> bool = <fun> *)

all_to_true (1 < 2);;
(*- : bool = true*)

all_to_true (2 < 1);;
(*- : bool = true *)

(*all_to_true 0;;
Error: This expression has type int but an expression was expected of type bool
Error de tipos introduce un int cuando se debe introducir un bool. *)

let first_all_to_true = all_to_true;;
(*val first_all_to_true : bool -> bool = <fun> *)

let all_to_true = function x -> true;;
(*val all_to_true : 'a -> bool = <fun> 
Cualquier valor que reciba será true*)

all_to_true (1 < 2);; 
(*- : bool = true *)

all_to_true (2 < 1);;
(* - : bool = true *)

all_to_true 0;;
(*- : bool = true *)

(*first_all_to_true 0;;
Error: This expression has type int but an expression was expected of type bool
En esta función está la expresión anterior del all_to_true en la cual no cualquier valor será true, por lo tanto da un error de tipos porque el 0 no es un bool. *)

