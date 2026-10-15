module T = Domainslib.Task

let body s =
  let r, t, i = (Random.State.make [| s |], ref 0.0, ref 0) in
  while !t < 1.0 do
    incr i;
    t := !t +. Random.State.float r 1.0
  done;
  float_of_int !i

let () =
  let p, start, finish = (T.setup_pool ~num_domains:17 (), 1, 1_000_000) in
  let x =
    T.run p (fun _ -> T.parallel_for_reduce ~start ~finish ~body p ( +. ) 0.0)
  in
  Printf.printf "%f\n" (x /. float_of_int finish)
