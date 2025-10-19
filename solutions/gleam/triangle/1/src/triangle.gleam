fn great_than_zero(a: Float, b: Float, c: Float) -> Bool {
  a >. 0.0 && b >. 0.0 && c >. 0.0
}

fn sum_shape(f: Float, s: Float, e: Float) -> Bool {
  { f +. s } >=. e
}

fn get_valid_shape(a: Float, b: Float, c: Float) -> Bool {
  let is_greaten_than_zero = great_than_zero(a, b, c)

  case is_greaten_than_zero {
    True -> {
      sum_shape(a, b, c) && sum_shape(b, c, a) && sum_shape(a, c, b)
    }
    _ -> False
  }
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  case get_valid_shape(a, b, c) {
    True -> {
      { a == b } && { b == c }
    }
    _ -> False
  }
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  case get_valid_shape(a, b, c) {
    True -> {
      a == b || b == c || a == c
    }
    _ -> False
  }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  case get_valid_shape(a, b, c) {
    True -> {
      { a != b } && { b != c } && { a != c }
    }
    _ -> False
  }
}
