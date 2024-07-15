let is_prime n =
	let rec check_from i =
		i >= n ||
		(n mod i <> 0 && check_from (i+1))
	in check_from 2;; 

let next_prime n = 
	if ( n <= 1 ) then 0
	else let rec aux c = 
		if is_prime c then c
		else aux (c + 1)
	in aux (n + 1);;

let last_prime_to n = 
	if ( n <= 1 ) then 0
	else let rec aux c = 
		if is_prime c then c
		else aux (c - 1)
	in aux (n - 1);;

let is_prime2 n =
	let rec aux a =
		if n / a < a then true
		else if n mod a = 0 then false
		else aux (a + 1)
	in aux 2;;
