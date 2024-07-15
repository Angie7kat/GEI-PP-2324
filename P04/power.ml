(*POWER*)
let rec power x y = if y <= 0 then 1
		else x * power x (y - 1);;
		
(*POWER'*)
let rec power' x y = if y <= 0 then 1
		else if y mod 2 = 0 then power' (x * x) (y/2)
		else x * power' (x * x) (y/2);;

(*POWERF*)
let rec powerf x n = if n<= 0 then 1.
		else if n mod 2 = 0 then powerf (x *. x) (n/2)
		else x *. powerf (x *. x) (n/2);;
