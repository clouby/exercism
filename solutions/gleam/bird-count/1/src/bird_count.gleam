pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [first, ..] -> first
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [first, ..rest] -> [first + 1, ..rest]
  }
}

fn loop_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [first, ..rest] -> {
      case first == 0 {
        False -> {
          loop_birds(rest)
        }
        _ -> True
      }
    }
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  loop_birds(days)
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [first, ..rest] -> first + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [first, ..rest] -> {
      case first >= 5 {
        True -> 1 + busy_days(rest)
        False -> busy_days(rest)
      }
    }
  }
}
