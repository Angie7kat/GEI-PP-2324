(*
let rec insert x = function
	[] -> [x]
	| h::t -> if x <= h then x :: h :: t
		else h :: insert x t;;

let rec isort = function
	[] -> []
	| h::t -> insert h (isort t);; 
*)
		
let bigl = List.init 1_000_000 (fun x -> x + 1);; 
	
let insert_t x lst =
	let rec insert_aux acc = function
		[] -> List.rev (x :: acc)
		| h :: t -> if x <= h then List.rev_append acc (x :: h :: t)
			else insert_aux (h :: acc) t
	in insert_aux [] lst;;
  
let isort_t l =
	let rec isort_t2 l1 l2 = match l1 with
		| [] -> l2
		| h :: t -> isort_t2 t (insert_t h l2)
	in isort_t2 l [];; 

let rlist n = List.init n (fun x -> Random.int 1_000_000);;

let lc1 = List.init 10_000 (fun x -> x + 1);;
let lc2 = List.init 20_000 (fun x -> x + 1);;
let ld1 = List.rev lc1;;
let ld2 = List.rev lc2;;
let lr1 = rlist 10_000;;
let lr2 = rlist 20_000;;

let crono f x =
	let t = Sys.time () 
	in let _ = f x 
	in Sys.time () -. t;;

(*	Las listas son iguales:	
	# isort lc1 = isort_t lc1;;
	- : bool = true
	# isort lc2 = isort_t lc2;;
	- : bool = true
	# isort ld1 = isort_t ld1;;
	- : bool = true
	# isort ld2 = isort_t ld2;;
	- : bool = true
	# isort lr1 = isort_t lr1;;
	- : bool = true
	# isort lr2 = isort_t lr2;;
	- : bool = true

	crono isort lc1 -> 0.0013459999999999861
	crono isort_t lc1 -> 6.137943
	crono isort lc2 -> 0.00346600000000002462
	crono isort_t lc2 -> 27.650653
	
	crono isort ld1 -> 4.81194599999999895
	crono isort_t ld1 -> 0.00165799999999904912
	crono isort ld2 -> 18.914999
	crono isort_t ld2 -> 0.0117890000000002715
	
	crono isort lr1 -> 2.306407
	crono isort_t lr1 -> 3.40412700000000257
	crono isort lr2 -> 10.0359339999999975
	crono isort_t lr2 -> 13.741895

	En lc1/2 es más optima la isort porque es el caso más optimo a la hora de recorrer la lista, entonces lo hace más rápido que isort_t que al ser terminal tiene que comprobar todo.
	En ld1/2 pasa justo lo contrario que en lc1/2 porque isort tiene que ir poco a poco haciendo todas las comprobaciones e intercambios, por lo que es más lenta, isort_t es más optima y hace directamente las operaciones por lo que es más rápida.
	En la lista aleatoria los tiempos serán peores o mejores teniendo en cuenta como de cerca está esta lista de el mejor caso tanto en isort como isort_t.
*)

let isort_g f l = 
	let rec insert l1 l2 x = match l2 with 
		[] -> List.rev (x :: l1)
		| h::t -> if f x h then List.rev_append l1 ( x::h::t)
        		else insert (h::l1) t x
	in let rec ord lf li = match li with
				[] -> List.rev lf
				| h::t -> ord ( insert [] lf h) t
	in ord [] l;;

(* 
let rec split l = match l with
h1::h2::t -> let t1, t2 = split t
in h1::t1, h2::t2
| _ -> l, [];;

let rec merge (l1,l2) = match l1, l2 with
[], l | l, [] -> l
| h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, l2)
else h2 :: merge (l1, t2);;

let rec msort l = match l with
[] | [_] -> l
| _ -> let l1, l2 = split l
in merge (msort l1, msort l2);; *)

let bigl2 = List.init 2_000_000 (fun x -> x + 1);;

let split_t l = 
	let rec split_aux l1 l2 l3 = match l1 with
		[] -> List.rev l2, List.rev l3
		| h::[] -> split_aux [] (h::l2) l3
		| h1::h2::t -> split_aux  t (h1::l2) (h2::l3) 
	in split_aux l [] [];;
  
let merge_t (l1,l2) =
	let rec merge_aux l1 l2 l3 = match l1,l2 with
		[],[] -> List.rev l3
		| h::t, [] -> merge_aux t [] (h::l3)
		| [], h::t -> merge_aux [] t (h::l3)
		| h1::t1, h2::t2 -> if h1 <= h2 then merge_aux t1 l2 (h1::l3)
 			else merge_aux l1 t2 (h2::l3)
	in merge_aux l1 l2 [];;

let rec msort' l = match l with
	[] | [_] -> l
	| _ -> let l1,l2 = split_t l
in merge_t (msort' l1, msort' l2);; 

let bigl3 = [];;
(* msort' no dará stack overflow porque las funciones que utiliza, split_t y merge_t si son recursivas terminales *)  

(*	
	crono msort' lc1 -> 0.0611340000000000217
	crono msort' lc2 -> 0.12374099999999999
	
	crono msort' ld1 -> 0.0571959999999999691
	crono msort' ld2 -> 0.109603
	
	crono msort' lr1 -> 0.0575949999999999518
  	crono msort lr1 -> 0.037951000000000068
	crono msort' lr2 -> 0.112356000000000011
  	crono msort lr2 -> 0.08543
	
	Como se puede ver los tiempos son extremadamente bajos en cualquiera de las listas por lo que el algoritmo msort es mucho más eficiente que isort.
	En cuanto lr1 y lr2 el algoritmo de merge es tan eficiente que perdemos tiempo esforzandonos por hacerla recursiva terminal.
*)
  
let rec msort_g f l = 
    let merge (l1,l2) f =
    let rec merge_aux l1 l2 l3 = match l1,l2 with
        [],[] -> List.rev l3
        | h::t, [] -> merge_aux t [] (h::l3)
        | [], h::t -> merge_aux [] t (h::l3)
        | h1::t1, h2::t2 -> if f h1 h2 then merge_aux t1 l2 (h1::l3)
             else merge_aux l1 t2 (h2::l3)
    in merge_aux l1 l2 []
in match l with
    [] | [_] -> l
    | _ -> let l1,l2 = split_t l
in merge (msort_g f l1, msort_g f l2) f;;

