let isBoardFull = (board: BoardGame.boardState) => {
  board->Array.every(row =>
    row->Array.every(cell =>
      switch cell.state {
      | Filled(_) => true
      | _ => false
      }
    )
  )
}

let checkBoardWin = (~board: BoardGame.boardState, ~currentPlayer: BoardGame.player) => {
  let eachCellHasSamePlayer = (row: array<BoardGame.cell>, player) =>
    row->Array.every(cell =>
      switch cell.state {
      | Filled(p) => p === player
      | _ => false
      }
    )

  let horizontalWin = board->Array.some(row => eachCellHasSamePlayer(row, currentPlayer))

  let verticalWin = {
    Array.makeBy(3, i => i)
    ->Array.map(n => {
      let topCell = board->Array.getUnsafe(0)->Array.getUnsafe(n)
      let middleCell = board->Array.getUnsafe(1)->Array.getUnsafe(n)
      let bottomCell = board->Array.getUnsafe(2)->Array.getUnsafe(n)

      [topCell, middleCell, bottomCell]->eachCellHasSamePlayer(currentPlayer)
    })
    ->Array.some(v => v == true)
  }

  let diagonalWin = {
    let cell00 = board->Array.getUnsafe(0)->Array.getUnsafe(0)
    let cell02 = board->Array.getUnsafe(0)->Array.getUnsafe(2)
    let cell11 = board->Array.getUnsafe(1)->Array.getUnsafe(1)
    let cell22 = board->Array.getUnsafe(2)->Array.getUnsafe(2)
    let cell20 = board->Array.getUnsafe(2)->Array.getUnsafe(0)

    [cell00, cell11, cell22]->eachCellHasSamePlayer(currentPlayer) ||
      [cell20, cell11, cell02]->eachCellHasSamePlayer(currentPlayer)
  }

  horizontalWin || diagonalWin || verticalWin
}
