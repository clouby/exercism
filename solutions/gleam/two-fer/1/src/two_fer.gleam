import gleam/option.{type Option, None, Some}

pub fn two_fer(name: Option(String)) -> String {
  let current_name = case name {
    Some(n) -> n
    None -> "you"
  }

  "One for " <> current_name <> ", one for me."
}
