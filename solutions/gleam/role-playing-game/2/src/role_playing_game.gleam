import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(name, level, health, mana) if health <= 0 -> Some(Player(name, level, health: 100, mana: case level >= 10 {
      True -> Some(100)
      False -> mana
    }))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) if mana >= cost -> #(Player(..player, mana: Some(mana - cost)), cost * 2)
    Some(_) -> #(player, 0)
    None -> {
      case player.health {
        health if health >= cost -> #(Player(..player, health: health - cost), 0)
        _ -> #(Player(..player, health: 0), 0)
      }
    }
  }
}
