import gleam/int
import gleam/list

pub fn square_of_sum(n: Int) -> Int {
  let sum = list.range(1, n) |> int.sum
  sum * sum
}

pub fn sum_of_squares(n: Int) -> Int {
  let assert Ok(result) =
    list.range(1, n) |> list.reduce(fn(acc, x) { acc + { x * x } })
  result
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
