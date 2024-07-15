let rec fib n =
	if n <= 1 then n
	else fib (n-1) + fib (n-2);;

let fibto n = 
    let rec aux a =
    	let f = fib a in 
        	if f > n then ()
        	else (let _ = print_endline(string_of_int(f)) in aux (a + 1))
    in aux 0;;
    
let () =
  if Array.length Sys.argv <> 2 then
    raise(Failure "Invalid number of arguments")
  else
    let n = int_of_string Sys.argv.(1) in
    fibto n;;
