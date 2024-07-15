type 'a bintree =
    Empty
  | Node of 'a * 'a bintree * 'a bintree;;
  
let rec in_order = function
    Empty -> []
  | Node (r, i, d) -> (in_order i) @ (r :: in_order d);;
 
let rec insert ord tree n =  
	match tree with
	Empty -> Node (n, Empty, Empty)
	| Node (raiz, left, right) -> 
		if ord n raiz then 
			Node (raiz, insert ord left n, right)
		else Node (raiz, left, insert ord right n);;

let bst ord l = 
	let rec bst_aux l tree = match l with
		[] -> tree
		| h::t -> bst_aux t (insert ord tree h) 
	in bst_aux l Empty;;
	
let qsort f l = in_order (bst f l);;
