import gleam/list
import gleam/regexp
import gleam/string

pub type Lackdai {
  Sure
  Chill
  CalmDown
  Whatever
  Shy
  None
}

fn is_question(remark: String) -> Lackdai {
  case string.ends_with(string.trim(remark), "?") {
    True -> Sure
    False -> None
  }
}

fn is_chill(remark: String) -> Lackdai {
  let assert Ok(re) = regexp.from_string("^[^a-z]*[^0-9]$")
  let check_expression = regexp.check(re, _)
  case remark |> check_expression {
    True -> Chill
    False -> None
  }
}

fn is_yell_question(remark: String) -> Lackdai {
  let assert Ok(re) = regexp.from_string("^[A-Z?\\' ]+$")
  let check_expression = regexp.check(re, _)
  case { remark |> check_expression } && string.ends_with(remark, "?") {
    True -> CalmDown
    False -> None
  }
}

fn is_shy(remark: String) -> Lackdai {
  case string.is_empty(string.trim(remark)) {
    True -> Shy
    False -> None
  }
}

fn handle_hey(value: String) -> #(Lackdai, Lackdai, Lackdai, Lackdai) {
  #(is_question(value), is_chill(value), is_yell_question(value), is_shy(value))
}

pub fn hey(remark: String) -> String {
  case handle_hey(remark) {
    #(_, _, CalmDown, _) -> "Calm down, I know what I'm doing!"
    #(Sure, _, _, _) -> "Sure."
    #(_, _, _, Shy) -> "Fine. Be that way!"
    #(_, Chill, _, _) -> "Whoa, chill out!"
    _ -> "Whatever."
  }
}
