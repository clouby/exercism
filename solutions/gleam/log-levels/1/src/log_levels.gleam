import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[ERROR]: " <> rest | "[WARNING]: " <> rest | "[INFO]: " <> rest ->
      string.trim(rest)
    _ -> ""
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[ERROR]: " <> _ -> "error"
    "[WARNING]: " <> _ -> "warning"
    "[INFO]: " <> _ -> "info"
    _ -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  case log_line {
    "[ERROR]: " <> rest -> string.trim(rest) <> " (error)"
    "[WARNING]: " <> rest -> string.trim(rest) <> " (warning)"
    "[INFO]: " <> rest -> string.trim(rest) <> " (info)"
    _ -> ""
  }
}
