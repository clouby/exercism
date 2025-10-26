// TODO: please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(p) -> 1 + pizza_price(p)
    ExtraToppings(p) -> 2 + pizza_price(p)
  }
}

fn count_order_price(order: List(Pizza)) -> Int {
  case order {
    [] -> 0
    [_, ..rest] -> 1 + count_order_price(rest)
  }
}

fn process_order_price(order: List(Pizza)) -> Int {
  case order {
    [] -> 0
    [pizza, ..rest] -> {
      pizza_price(pizza) + process_order_price(rest)
    }
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case count_order_price(order) {
    1 -> 3 + process_order_price(order)
    2 -> 2 + process_order_price(order)
    x if x > 2 -> process_order_price(order)
    _ -> 0
  }
}
