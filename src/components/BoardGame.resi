type player =
  | Cross
  | Circle

type rec cell = {
  coords: cellCoords,
  state: cellState,
}
and cellState =
  | Empty
  | Filled(player)
and cellCoords = {
  x: int,
  y: int,
}

type boardState = array<array<cell>>

@react.component
let make: (~board: boardState, ~onCellClick: cell => unit) => React.element
