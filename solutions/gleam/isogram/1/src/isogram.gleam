import gleam/string

fn loop_acc(acc: List(String), word: String) {
  case acc {
    [] -> False
    [first_element, ..rest] -> {
      case first_element == word {
        False -> {
          loop_acc(rest, word)
        }
        True -> True
      }
    }
  }
}

fn loop_isogram(words: List(String), acc: List(String)) -> Bool {
  case words {
    [] -> True
    [first_element, ..rest] -> {
      case first_element {
        " " | "-" -> {
          loop_isogram(rest, acc)
        }
        _ -> {
          case loop_acc(acc, first_element) {
            True -> False
            False -> {
              loop_isogram(rest, [first_element, ..acc])
            }
          }
        }
      }
    }
  }
}

pub fn is_isogram(phrase phrase: String) -> Bool {
  case phrase {
    "" -> True
    _ -> {
      loop_isogram(phrase |> string.lowercase |> string.to_graphemes, [])
    }
  }
}
