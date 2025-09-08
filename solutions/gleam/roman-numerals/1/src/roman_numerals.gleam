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
  #(1, "I"),
]

fn do_convert(number: Int, accumulator: String) -> String {
  case number <= 0 {
    True -> accumulator
    False -> {
      // This will always find a value because the list contains `#(1, "I")`
      // and the input is expected to be positive.
      let assert Ok(#(value, numeral)) =
        list.find(numerals, fn(item) { item.0 <= number })
      do_convert(number - value, accumulator <> numeral)
    }
  }
}

pub fn convert(number: Int) -> String {
  do_convert(number, "")
}
