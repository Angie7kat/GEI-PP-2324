let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;

let rec orbit n =
	if n > 1 then string_of_int(n) ^ ", " ^ orbit(f(n))
	else "1";;
	
let rec length n =
	if n = 1 then 0
	else 1 + length(f(n));;

let top n =
	let rec aux (a,b) =
		if a = 1 then b
		else aux (f a, max a b)
	in aux (n, 0);;
	
let length'n'top n = 
	let rec aux (a, b, c) =
		if a = 1 then (c,b)
		else aux( f a, max a b, c + 1)
	in aux (n, 0, 0);;
		
let longest_in m n =
	let rec aux a b c =
		if a > n then (b,c)
		else if length a > c then aux (a + 1) a (length a)
		else aux (a + 1) b c
	in aux m 0 0;;
	
let highest_in m n =
	let rec aux a b c =
		if a > n then (b,c)
		else if top a > c then aux (a + 1) a (top a)
		else aux (a + 1) b c
	in aux m 0 0;;

