import gleam/list

pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  [language, ..languages]
}

fn count_loop(languages: List(String), count: Int) -> Int {
  case languages {
    [] -> count
    [_, ..rest] -> count_loop(rest, count + 1)
  }
}

pub fn count_languages(languages: List(String)) -> Int {
  count_loop(languages, 0)
}

fn reverse_loop(from source: List(a), to target: List(a)) {
  case source {
   []  -> target
   [head, ..rest] -> reverse_loop(from: rest, to: [head, ..target])
  }
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  reverse_loop(from: languages, to: [])
}

pub fn exciting_list(languages: List(String)) -> Bool {
  case languages {
    [x, ..] if x == "Gleam" -> True
    [_, x] if x == "Gleam" -> True
    [_, y, _] if y == "Gleam" -> True
    _ -> False
  }
}
