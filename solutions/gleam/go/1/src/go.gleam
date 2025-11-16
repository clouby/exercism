import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
   case Ok(game) |> result.try(rule1) |> result.map(rule2) |> result.try(rule3) |> result.try(rule4) {
    Ok(game) -> Game(..game, player: Black)
    Error(error) -> Game(0, 0, White, error)
  }
}
