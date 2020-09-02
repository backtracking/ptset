
let test empty add mem =
  let max_int = 1 lsl 30 - 1 in
  let seed = Random.int max_int in
  Random.init seed;
  let s =
    let rec loop s i =
      if i = 1000 then s else loop (add (Random.int max_int) s) (succ i)
    in
    loop empty 0
  in
  Random.init seed;
  for _i = 0 to 999 do assert (mem (Random.int max_int) s) done

(* basic add/mem tests *)
let () =
  test Ptset.empty Ptset.add Ptset.mem;
  test Ptset.Big.empty Ptset.Big.add Ptset.Big.mem;
  test Ptset.BigPos.empty Ptset.BigPos.add Ptset.BigPos.mem

open Ptset

(* the bug from "QuickChecking Patricia Trees" is fixed *)
let () =
  let s1 = add min_int (add 0 empty) in
  let s2 = add min_int (add 1 empty) in
  let s = union s1 s2 in
  assert (cardinal s = 3)
