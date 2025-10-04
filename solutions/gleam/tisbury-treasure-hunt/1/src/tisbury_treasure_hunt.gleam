pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  case place_location {
    #(s_value, i_value) -> #(i_value, s_value)
  }
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

fn loop_find_count_place_treasure(
  current_place: #(String, #(String, Int)),
  current_treasures: List(#(String, #(Int, String))),
  count: Int,
) -> Int {
  case current_treasures {
    [] -> count
    [first, ..rest] -> {
      let match_count = case
        treasure_location_matches_place_location(current_place.1, first.1)
      {
        True -> count + 1
        False -> count
      }
      loop_find_count_place_treasure(current_place, rest, match_count)
    }
  }
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  loop_find_count_place_treasure(place, treasures, 0)
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let #(found_treasure_name, _) = found_treasure
  let #(place_name, _) = place
  let #(desired_treasure_name, _) = desired_treasure
  case place_name {
    "Abandoned Lighthouse" -> {
      found_treasure_name == "Brass Spyglass"
    }
    "Stormy Breakwater" -> {
      {
        desired_treasure_name == "Crystal Crab"
        || desired_treasure_name == "Glass Starfish"
      }
      && found_treasure_name == "Amethyst Octopus"
    }
    "Harbor Managers Office" -> {
      {
        desired_treasure_name == "Model Ship in Large Bottle"
        || desired_treasure_name == "Antique Glass Fishnet Float"
      }
      && found_treasure_name == "Vintage Pirate Hat"
    }
    _ -> False
  }
}
