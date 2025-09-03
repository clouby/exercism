import gleam/int

pub fn convert(number: Int) -> String {

  case number % 3 == 0, number % 5 == 0, number % 7 == 0 {
    True, True, True -> "PlingPlangPlong"
    True, True, _ -> "PlingPlang"
    True, _, True -> "PlingPlong"
    _, True, True -> "PlangPlong"
    True, _, _ -> "Pling"
    _, True, _ -> "Plang"
    _, _, True -> "Plong"
    _, _, _ -> int.to_string(number)
  }
}
