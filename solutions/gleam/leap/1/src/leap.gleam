pub fn is_leap_year(year: Int) -> Bool {
  let divisible_by_four = year % 4 == 0
  let century_year_exception = !{ year % 100 == 0 }
  let exception_to_exception = century_year_exception || year % 400 == 0

  divisible_by_four && exception_to_exception
}
