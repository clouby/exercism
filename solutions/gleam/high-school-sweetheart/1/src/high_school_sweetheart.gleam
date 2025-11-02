import gleam/result
import gleam/string

pub fn first_letter(name: String) {
  name |> string.trim |> string.first |> result.unwrap("")
}

pub fn initial(name: String) {
  first_letter(name) |> string.uppercase |> string.append(".")
}

pub fn initials(full_name: String) {
  case full_name |> string.split(on: " ") {
    [first_name, last_name] -> {
      initial(first_name) <> " " <> initial(last_name)
    }
    [fist_name] -> initial(fist_name)
    [] | _ -> ""
  }
}

pub fn pair(full_name1: String, full_name2: String) {
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> initials(full_name1) <> "  +  " <> initials(full_name2) <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
