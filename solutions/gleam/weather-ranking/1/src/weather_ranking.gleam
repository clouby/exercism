import gleam/float
import gleam/list
import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  let left_case = case left {
    Celsius(f) -> f
    Fahrenheit(f) -> fahrenheit_to_celsius(f)
  }
  let right_case = case right {
    Celsius(f) -> f
    Fahrenheit(f) -> fahrenheit_to_celsius(f)
  }

  float.compare(left_case, with: right_case)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, by: fn(c1, c2) -> Order {
    compare_temperature(c1.temperature, c2.temperature)
  })
}
