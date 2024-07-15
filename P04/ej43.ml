(*REVERSE*)
let rec exp10 n = if n = 0 then 1 else 10 * exp10(n-1);;

let rec num_cifras = function 
  | x when (x < 10 && x > -10) -> 1 
  | x -> 1 + num_cifras(x/10);;
  
let rec reverse x = if x < 10 
		then x else
		x mod 10 * exp10(num_cifras(x) - 1) + ( reverse(x/10));;
(*PALINDROMO*)
let palindromo x = if String.length x <= 1 then true 
		else let rec aux a b =
			 if (String.length a) / 2 <= b then true
    			else if a.[b] <> a.[String.length a - b - 1] then false
    			else aux a (b+1)
  			in aux x 0;;

(*MCD*)
let rec mcd (x, y) = if x < y then mcd (y, x)
	else if x mod y = 1 then x mod y
	else if x mod y = 0 then y
	else mcd ( x mod y, y);;
