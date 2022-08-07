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

module Cell = {
  @react.component
  let make = (~cell: cell, ~onClick, ~className="") => {
    <button className={cx(["w-28 sm:w-48 h-28 sm:h-48 bg-white", className])} onClick>
      {switch cell.state {
      | Empty => React.null
      | Filled(Cross) => <Cross />
      | Filled(Circle) => <Circle />
      }}
    </button>
  }
}
@react.component
let make = (~board: boardState, ~onCellClick) => {
  <section className="border-8 border-purple-200 rounded-lg">
    {board
    ->Array.mapWithIndex((x, row) => {
      <div key={`row-${x->Int.toString}`} className={"flex flex-row w-full"}>
        {row
        ->Array.mapWithIndex((y, cell) => {
          <Cell
            key={`cell-${x->Int.toString}${y->Int.toString}`}
            cell
            onClick={_ => onCellClick(cell)}
            className={cx([
              switch (x, y) {
              | (0, 0) => "rounded-tl-lg"
              | (2, 0) => "rounded-bl-lg"
              | (0, 2) => "rounded-tr-lg"
              | (2, 2) => "rounded-br-lg"
              | _ => ""
              },
              switch (x, y) {
              | (1, 1) => "border"
              | (_, 1) => "border-l border-r"
              | (1, _) => "border-t border-b"
              | _ => ""
              },
            ])}
          />
        })
        ->React.array}
      </div>
    })
    ->React.array}
  </section>
}
