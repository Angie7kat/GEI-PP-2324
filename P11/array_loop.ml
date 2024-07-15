let append a1 a2 = 
	if Array.length a1 + Array.length a2 > Sys.max_array_length 
	then raise (Invalid_argument "append")
	else Array.init (Array.length a1 + Array.length a2) (function x -> 
		if Array.length a1 > x then a1.(x)
		else a2.(x - Array.length a1));;
    
let sub a pos len = 
	if pos < 0 || len < 0 || pos + len > Array.length a then raise (Invalid_argument "sub")
	else Array.init len (function x -> a.(pos + x));;
  
let copy a =
	Array.init (Array.length a) (function x -> a.(x));;

let fill a pos len x =  
	if (pos < 0 || pos + len > Array.length a || pos > Array.length a || len < 0) 
	then raise (Invalid_argument "fill")
	else
		for i = pos to len do 
			a.(i) <- x;
	done;;

let blit a a_pos b b_pos len = 
	if ( a_pos < 0 || a_pos + len > Array.length a || a_pos > Array.length a || len < 0 ||
		b_pos < 0 || b_pos + len > Array.length a || b_pos > Array.length a || len < 0)
	then raise (Invalid_argument "blit")
	else for i = 0 to len - 1 do 
		b.(b_pos + i) <- a.(a_pos + i)
	done;;
  
let to_list a = 
	let l = ref []
	in let x = ref (Array.length a - 1)
	in while !x > (-1) do
		l := a.(!x) :: !l;
		x := !x - 1; 
	done;
	!l;;

let iter f a = 
	for i = 0 to (Array.length a - 1) do 
		f a.(i); 
	done;;
  
let fold_left f n a = 
	let x = ref n
	in for i = 0 to (Array.length a - 1) do
		x := f !x a.(i); 
	done;
	!x;;
  
let for_all f a = 
	let x = ref 0 
	in while !x < Array.length a && f a.(!x) do 
		x := !x + 1;
	done;
	!x = Array.length a;;
  
let exists f a =  
	let x = ref 0 
	in while !x < Array.length a && not(f a.(!x)) do 
		x := !x + 1;
	done;
	!x < Array.length a;;

let find_opt f a = 
	let x = ref 0
	in while !x < Array.length a && not (f a.(!x)) do
		x := !x + 1;
	done;
	if !x = Array.length a then None
	else Some a.(!x);;
