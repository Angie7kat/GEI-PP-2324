let length l = 
	let l1 = ref l 
	in let x = ref 0 
	in while !l1 <> [] do 
		x := !x + 1;
		l1 := List.tl !l1; 
	done;
	!x;;

let last l =
	let l1 = ref l in
	if !l1 = [] then raise (Failure ("last"))
	else while List.tl !l1 <> [] do
		l1 := List.tl !l1;
	done;
	List.hd !l1;;
  
let nth l n = 
	let l1 = ref l
	in let x = ref 0 in
	if n < 0 then raise (Invalid_argument "nth")
	else if !l1 = [] then raise (Failure "nth")
	else while !x < n do
		l1 := List.tl !l1;
		x := !x + 1;
	done;
	List.hd !l1;;

let rev l =
	let l1 = ref l
	in let l2 = ref []
	in while !l1 <> [] do
		l2 := List.hd !l1 :: !l2;
		l1 := List.tl !l1;
	done;
	!l2;;

let append l1 l2 = 
	let a = ref (rev l1) 
	in let b = ref l2
	in while !a <> [] do
		b := List.hd !a :: !b;
		a := List.tl !a;
	done;
	!b;;

let concat l = 
	let a = ref l
	in let b = ref []
	in while !a <> [] do
		b := append  !b (List.hd !a);
		a := List.tl !a;
	done;
	!b;; 

let for_all f l =
	let a = ref l 
	in while !a <> [] && f (List.hd !a) do 
		a := List.tl !a;
	done; 
	!a = [];;

let exists f l = 
	let a = ref l
	in while !a <> [] && not (f (List.hd !a)) do
		a := List.tl !a;
	done;
	!a <> [];;

let find_opt f l = 
	let a = ref l 
	in while !a <> [] && not (f (List.hd !a)) do
		a := List.tl !a;
	done;
	if !a = [] then None
	else Some (List.hd !a);;

let iter f l = 
	let a = ref l
	in while !a <> [] do
		f (List.hd !a);
		a := List.tl !a;
	done;;
    
let fold_left f n l = 
	let a = ref l
	in let x = ref n
	in while !a <> [] do
		x := f !x (List.hd !a);
		a := List.tl !a;  
	done;
	!x;; 
