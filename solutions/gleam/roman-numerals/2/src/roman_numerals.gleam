import gleam/list

const numerals: List(#(Int, String)) = [
  #(1000, "M"),
  #(900, "CM"),
  #(500, "D"),
  #(400, "CD"),
  #(100, "C"),
  #(90, "XC"),
  #(50, "L"),
  #(40, "XL"),
  #(10, "X"),
  #(9, "IX"),
  #(5, "V"),
  #(4, "IV"),
  #(1, "I")
]

fn is_less_than(number: Int, value: #(Int, String)) -> Bool{
  value.0 <= number
}

fn recursive_convert(number: Int, result: String) {
  case number <= 0 {
    True -> result
    False -> {
      case list.find(numerals, is_less_than(number, _)) {
        Ok(#(value, symbol)) -> recursive_convert(number - value, result <> symbol)
        Error(_) -> result
      }
    }
  }
}

pub fn convert(number: Int) -> String {
  recursive_convert(number, "")
}
