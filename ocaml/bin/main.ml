module T = Domainslib.Task

let go _ =
  let t, i = (ref 0.0, ref 0) in
  while !t < 1.0 do
    incr i;
    t := !t +. Random.float 1.0
  done;
  !i

let () =
  let n = 1_000_000 in
  let pool = T.setup_pool ~num_domains:15 () in
  let x =
    T.run pool (fun _ ->
        T.parallel_for_reduce ~start:1 ~finish:n ~body:(Fun.const go ()) pool
          ( + ) 0)
  in
  Printf.printf "%f\n" (float_of_int x /. float_of_int n)
