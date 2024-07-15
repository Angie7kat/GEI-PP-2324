let hd h = match h with
	[] -> raise (Failure "List.hd")
	|h::_ -> h;;
	
let tl t = match t with
	[] -> raise (Failure "List.tl")
	|_::t -> t;;
	
let length l1 =
	let rec aux(l2, i) =
		if l2 = [] then i
		else aux (tl l2, i + 1)
	in aux(l1,0);; 

(* te dice cual de dos listas es más larga *)
let rec compare_lengths l1 l2 = match (l1,l2) with
	([],[]) -> 0
	|([], _) -> -1
	|(_, []) -> 1
	|(_::t1,_::t2) -> compare_lengths t1 t2;;
	
let rec compare_length_with l n = if n < 0 then 1
		else match (l, n) with
			([],0) -> 0
			|([], _) -> -1
			|(_, 0) -> 1
			|(_::t, _) -> compare_length_with t (n-1);;
(*Crea una lista de la longitud indicada que cumpla la función dada *)	
let init n f = 
	let rec aux n a =
		if n - 1 < 0 then a
    		else aux (n-1) (f (n-1) :: a)
  	in aux n [];; 
	
(* Retorna el n elemento de l *)
let nth l n = 
	if n < 0 then raise (Invalid_argument "List.nth")
	else let rec aux (l1,i) = match (l1, i) with 
			([], _) -> raise (Failure "List.nth") (* no puedes buscar un elemento concreto en una lista vacía *)
			|(h::_, 0) -> h
			|(_::t, i) -> aux(t, i - 1)
		in aux(l, n);;

(* Concatena l1 y l2 *)		
let rec append l1 l2 = match l1 with
		[] -> l2
		|h::t -> h::(append t l2);;

(* Primero le da la vuelta a l1, luego la concatena con l2 *)	 
let rec rev_append l1 l2 = match l1 with
		[] -> l2
		|h::t -> rev_append t (h::l2);;

(* Le da la vuelta a la lista *)
let rev l = rev_append l [];;

(* Concatena una lista de listas *)
let rec concat = function
	[] -> []
	| h::t -> append h (concat t);;
	
let flatten = concat;;

(*Transforma una lista de pares en un par de listas *)
let rec split l = match l with
		[] -> ([],[])
		| (h1,h2)::t -> let (l1,l2) = split t in (h1::l1,h2::l2);;

(* Transforma un par de listas en una lista de pares *)
let rec combine l1 l2 = match (l1,l2) with
		([],[]) -> []
		| (h1::t1),(h2::t2) -> (h1,h2):: combine t1 t2
		| _ -> raise(Invalid_argument "List.combine");; (* las listas tienen distinta longitud *)

(* Aplica la función a los elementos de la lista *)
let rec map f l = match l with
		[] -> []
		| h::t -> (f h) :: (map f t);; 

(* map en dos listas *)
let rec map2 f l1 l2 = match (l1,l2) with
		([], []) -> []
		| ([],_) | (_, []) -> raise (Invalid_argument "List.map2")
		|(h1::t1, h2::t2) -> f h1 h2 :: map2 f t1 t2;;
		
let rev_map f l = rev (map f l);;

(* Comprueba que todos los elementos de la lista satisfagan el predicado *)
let rec for_all p l = match l with
		[] -> true
		| h::t -> (p h) && (for_all p t);;

(* Comprueba que al menos uno de los elementos de la lista cumpla el predicado *)
let rec exists p l = match l with
		[] -> false
		|h::t -> p h || exists p t;;

(* Comprueba que n está en la lista *)
let rec mem n l = match l with
		[] -> false
		| h::t -> if n = h then true
			else (mem n t);;
			
(* Encuentra el primer elemento que cumple el predicado *)
let rec find f l = match l with
		[] -> raise (Not_found)
		| h::t -> if f h then h
			else find f t;;

(* Devuelve una lista que contiene solo los elementos que cumplen el predicado *)
let rec filter f l = match l with
		[] -> []
		| h::t -> if f h then h::(filter f t)
			else (filter f t);;

let find_all p = filter p;;

(* Devuelve un par de listas una con los elementos que cumplen el predicado p y otra que no *)
let rec partition p l = match l with
		[] -> [], []
		| h::t -> let (satisface, noSatisface) = partition p t
			in if (p h) then ( h::satisface, noSatisface)
				else (satisface, h::noSatisface);;

let rec fold_left f a = function
		[] -> a
		| h::t -> fold_left f (f a h) t;;

let rec fold_right f l a = match l with
		| [] -> a
		| h::t -> f h (fold_right f t a);;

(* En un par busca si el primer elemento de ese par coincide con la key si es cierto devuelve el otro valor *)
let rec assoc a l = match l with
		[] -> raise (Not_found)
		|(x, y)::t -> if a = x then y
				else assoc a t;;
(* Lo mismo que assoc pero devuelve un booleano *)			
let rec mem_assoc a l = match l with
		[] -> false
		| (x, _)::t -> if x = a then true
				else mem_assoc a t;;

(* Busca un elemento que tenga la key introducida y lo borra *)
let rec remove_assoc a l = match l with
		[] -> []
		| (x, y)::t -> if x = a then t
				else (x, y)::remove_assoc a t;;

