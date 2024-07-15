(* let rec to0from n =
	if n < 0 then []
	else n :: to0from (n-1) *)
let to0from n = 
	let rec aux l m = 
		if m < 0 then List.rev l
		else aux (m::l) (m - 1)
	in aux [] n;;
	
(* let rec fromto m n =
	if m > n then []
	else m :: fromto (m+1) n *)
let fromto m n =
	let rec aux l x =
		if x > n then List.rev l
		else aux (x::l) (x + 1)
	in aux [] m;;
		
(* let rec remove x = function
	[] -> []
	| h::t -> if x = h then t
	else h :: remove x t *)
let remove x l =
	let rec remove_aux l1 l2 = match l1 with
		[] -> l
		| h::t -> if x = h then List.rev_append l2 t
			else remove_aux t (h::l2)
	in remove_aux l [];;
	
(* let rec compress = function
	h1::h2::t -> if h1 = h2 then compress (h2::t)
		else h1 :: compress (h2::t)
	|l -> l *)	
let compress l =
  let rec aux lf li = match li with
        | h1::h2::t-> if h1 = h2 then aux lf (h2::t)
                       else aux (h1::lf) (h2::t)
        | [h] -> aux (h::lf) []
        | []-> List.rev lf
  in (aux [] l);;
 
(* let append' = List.append *)
let append' l1 l2 =
	let rec aux x y = match x with
		[] -> List.rev_append y l2
		| h::t -> aux t (h::y)
	in aux l1 [];;

(* let map' = List.map *)
let map' f l =
    let rec aux f l acc = match l with
        [] -> List.rev acc
        | h::t -> aux f t ((f h)::acc)
    in aux f l [];;
    
(* let fold_right' = List.fold_right *)
let fold_right' f l n =
	let rec fold_aux l1 x = match l1 with
		[] -> x
		| h::t -> fold_aux t (f h x)
	in fold_aux l n;;

(* let incseg l =
List.fold_right (fun x t -> x::List.map ((+) x) t) l [] *)
let incseg l = 
    let rec aux l acc l2 = match l with
        [] -> []
        | [h] -> List.rev ((h + acc)::l2)
        | h::t -> aux t (h + acc) ((h + acc)::l2)
    in aux l 0 [];;
