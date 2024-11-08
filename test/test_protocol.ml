open OUnit2
open Protocol.Encoder

let encode_me = "To be encoded"

module TestEncoder : Encoder  = struct
  let encoding = 2
  let value = 2
  let read data = let source = Bytes.of_string encode_me in
    Bytes.blit source 0 data 0 (Bytes.length source);
    Bytes.length data
end

let test_encoder_read_length _ = let expected = Bytes.of_string encode_me in 
  let d = Bytes.create (String.length encode_me) in
  assert_equal (TestEncoder.read d) (Bytes.length expected) ~printer:string_of_int


let suite = 
  "Encoder Tests" >::: [
    "Test Encoder" >:: test_encoder_read_length
  ]


let () = run_test_tt_main suite
