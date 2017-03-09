#!/bin/bash

set -x

ocaml <<EOF
#use "ptset.ml";;
assert(find_first (fun x -> x > 2) (of_list [1;2;3;4;5]) = 3);;
assert(find_last (fun x -> x < 5) (of_list [1;2;3;4;5]) = 4);;
EOF
