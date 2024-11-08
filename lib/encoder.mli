module type Encoder = sig
  val encoding : int
  val value : int
  val read : bytes -> int
end
