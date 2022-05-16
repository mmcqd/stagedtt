open Prelude
module D = Data

type t = D.inner =
  | Local of int
  | Global of global

  | Lam of Ident.t * t
  | Ap of t * t

  | Zero
  | Suc of t
  | NatElim of {scrut : t ; zero : t ; suc : t}

  | Quote of t
  | Splice of t

  | CodePi of t * t
  | CodeUniv of int
  | CodeNat of int

and global =
  [ `Unstaged of Ident.path * D.value Lazy.t * D.inner Lazy.t
  | `Staged of Ident.path * D.value Lazy.t * D.inner Lazy.t * (int -> D.outer)
  ]
