();;
(*- : unit = () *)

2 + 5 * 3;; 
(* - : int = 17
Muestra el resultado de la operación, multiplicar 5 por 3 más 2, 17. *)

1.25 *. 2.0;; 
(* - : float = 2.5
Muestra el resultado de la multiplicación, 2.5. *)

(*2 - 2.0;; 
Error de tipos no se puede restar un entero y un float. *)

(*3.0 + 2.0;; 
Error: This expression has type float but an expression was expected of type int. 
Error de tipo, para que la suma sea realizada debería escribirse 3 + 2;; o 3.0 +. 2.0;; *)

5 /3;; 
(* - : int = 1
Divide 5/3. *)

5 mod 3;; 
(* - : int = 2
Muestra el resto de la división entre 5 y 3 *)

2.0 *. 3.0 ** 2.0;; 
(* - : float = 18.
Muestra el resultado de 2 multiplicado por tres elevado al cuadrado.*)

2.0 ** 3.0 ** 2.0;; 
(* - : float = 512.
Muestra el resultado de dos elevado a nueve, 512. *)

sqrt;; 
(* - : float -> float = <fun>
Es una función, raíz cuadrada.*)

(* sqrt 4;; 
Error de tipo. This expression has type int but an expression was expected of type float.
Para utilizar sqrt tiene que recibir un float.  *)

int_of_float;; 
(* - : float -> int = <fun>
Es una función, pasa un float en int. *)

float_of_int;; 
(* - : int -> float = <fun>
Es una función, pasa un int a float. *)

3.0 = float_of_int 3;; 
(* - : bool = true
Pasa un float en un int para poder compararlo con otro int, devuelve un booleano. *)

(* int_of_float -2.9;; 
Error de tipo. This expression has type float -> int but an expression was expected of type int.*)

int_of_float 2.1 + int_of_float (-2.9);; 
(* - : int = 0
Vuelve los dos valores en int y los suma, resultado 0 *)

truncate;; 
(* - : float -> int = <fun>
Es una función, truncar. *)

truncate 2.1 + truncate (-2.9);; 
(* - : int = 0
Trunca el resultado de la suma de 2 y -2.9, el resultado es 0. *)

floor;; 
(* - : float -> float = <fun>
Es una función. *)

floor 2.1 +. floor (-2.9);; 
(* - : float = -1.
Aproxima hacía abajo los números y luego los suma, resultado -1 *)

ceil;; 
(* - : float -> float = <fun>
Es una función. *)

ceil 2.1 +. ceil (-2.9);; 
(* - : float = 1.
Aproximamos hacia arriba los numeros y luego los sumamos dando como resultado 1. *)

int_of_char;; 
(* - : char -> int = <fun>
Es una función, pasa un char a su int correspondiente.*)

int_of_char 'A';; 
(* - : int = 65
Pasa un char que le pasas a su int correspondiente, devuelve 65. *)

char_of_int;; 
(* - : int -> char = <fun>
Es una función, pasa el int introducido a su char correspondiente. *)

char_of_int 66;; 
(*- : char = 'B' 
Devuelve el char al que le corresponde ese int, B .*)

Char.code;;
(* - : char -> int = <fun>
Es una función. *)

Char.code 'B';; 
(* - : int = 66
Devuelve el int correspondiente al char B. *)

Char.chr;; 
(* - : int -> char = <fun>
Es una función. *)

Char.chr 67;;
(* - : char = 'C'
Te devuelve el char correspondiente al entero 67, C. *)

'\067';; 
(* - : char = 'C'
Te devuelve el char correspondiete al int 067. *)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');; 
(* - : char = 'm'
Hace el calculo de los ints correspondientes a esos char y muestra el ersultado en char. *)

Char.lowercase_ascii;; 
(* - : char -> char = <fun>
Es una función. *)

Char.lowercase_ascii 'M';; 
(* - : char = 'm'
Devuelve el char introducido en minúscula *)

Char.uppercase_ascii;; 
(* - : char -> char = <fun>
Es una función. *)

Char.uppercase_ascii 'm';; 
(* - : char = 'M'
Devuelve el char introducido en mayúscula *)

"this is a string";; 
(* - : string = "this is a string" *)

String.length;; 
(* - : string -> int = <fun>
Es una función. *)

String.length "longitud";;
(* - : int = 8
Muestra la longitud del string indicado, 8. *)

(* "1999" + "1";; 
Error de tipos. 
This expression has type string but an expression was expected of type int. *)

"1999" ^ "1";; 
(* - : string = "19991"
Concatena los strings. *)

int_of_string;; 
(* - : string -> int = <fun>
Es una función. *)

int_of_string "1999" + 1;; 
(* - : int = 2000
Convierte el string en un int y luego le suma 1, 2000 *)

"\065\066";; 
(* - : string = "AB"
Te devuelve sus char correspondientes. *)

string_of_int;; 
(* - : int -> string = <fun>
Es una función. *)

string_of_int 010;; 
(* - : string = "10"
Convierte un int en un string. *)

not true;; 
(* - : bool = false
No verdadero. *)

true && false;; 
(* - : bool = false
Verdadero y falso( operación lógica 1 y 0 = 0). *)

true || false;; 
(* - : bool = true
Verdadero o falso( operación lógica 1 o 0 = 1). *)

(1 < 2) = false;; 
(* - : bool = false
Asigna que 1<2 es falso. *)

"1" < "2";; 
(* - : bool = true
Compara el valor ascii del 1 y el 2 y muestra un boolean. *)

2 < 12;; 
(* - : bool = true *)

"2" < "12";; 
(* bool = false *)

"uno" < "dos";; 
(* - : bool = false *)

if 3 = 4 then 0 else 4;; 
(* - : int = 4
Si 3 = 4, 0 si no 4. *)

if 3 = 4 then "0" else "4";; 
(* - : string = "4"
Si 3 = 4, "0" si no "4". *)

(* if 3 = 4 then 0 else "4";; 
Error de tipos. This expression has type string but an expression was expected of type int *)

(if 3 < 5 then 8 else 10) + 4;;
(* - : int = 12
Si 3 es menor que 5, 8 y luego le sumamos 4, si no, 10 y le sumamos 4. *) 

