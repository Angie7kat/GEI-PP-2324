let rec factorial = function 0 -> 1 | n -> n * factorial (n-1);;
(*val factorial : int -> int = <fun>*)

factorial 0 + factorial 1 + factorial 2;;
(* - : int = 4
Suma el resultado del factorial de 0, más el de 1, más el de 2 *)

factorial 10;;
(* - : int = 3628800
Saca el factorial de 10 *)

factorial 100;;
(* - : int = 0 
El factorial de 100 supera el número máximo de un int - : int = 4611686018427387903*)

factorial (-1);;
(* Stack overflow during evaluation (looping recursion?).
Se ejecuta infinitas veces porque nunca llega a cero por lo que da overflow. *)

let rec sumto n = if n = 0 then 0 else n + sumto(n-1);;

let rec exp10 n = if n = 0 then 1 else 10 * exp10(n-1);;

let rec num_cifras = function 
  | x when (x < 10 && x > -10) -> 1 
  | x -> 1 + num_cifras(x/10);;
  
let rec sum_cifras n = if n < 10 && n > -10 then abs n else abs(n mod 10) + sum_cifras(n/10);;

