let emptyBoard = Array.makeBy(3, x =>
  Array.makeBy(3, y => {
    let cell: BoardGame.cell = {
      coords: {x: x, y: y},
      state: Empty,
    }

    cell
  })
)

@react.component
let make = () => {
  let (board, setBoard) = React.useState(() => emptyBoard)
  let (currentPlayer, setPlayer) = React.useState(() => BoardGame.Cross)
  let (gameEnd, setGameEnd) = React.useState(() => None)

  let onCellClick = (cell: BoardGame.cell) => {
    switch cell.state {
    | Empty => {
        let newBoard = board->Array.mapWithIndex((x, row) => {
          row->Array.mapWithIndex((y, c) => {
            if cell.coords.x === x && cell.coords.y === y {
              {
                ...c,
                state: Filled(currentPlayer),
              }
            } else {
              c
            }
          })
        })
        setBoard(_ => newBoard)

        let currentPlayerHasWinMove = Utils.checkBoardWin(~board=newBoard, ~currentPlayer)

        if currentPlayerHasWinMove {
          setGameEnd(_ => Some(Some(currentPlayer)))
        } else if Utils.isBoardFull(newBoard) {
          setGameEnd(_ => Some(None))
        } else {
          setPlayer(currentPlayer => {
            switch currentPlayer {
            | Cross => Circle
            | Circle => Cross
            }
          })
        }
      }
    | _ => ()
    }
  }

  <main className="bg-purple-100 w-full h-full flex justify-center sm:items-center pt-12 sm:pt-0">
    <div>
      {switch gameEnd {
      | None => React.null
      | Some(winner) =>
        <EndGameDialog
          winner
          onRestartClick={_ => {
            setBoard(_ => emptyBoard)
            setGameEnd(_ => None)
          }}
          onBackClick={_ => ()}
        />
      }}
      <h1
        className="text-2xl font-semibold text-purple-500 text-center font-indie-flower text-[3rem] sm:text-[5rem] mb-8">
        {"Tic Tac Toe"->React.string}
      </h1>
      <div className="flex flex-row items-center justify-center">
        <p className="text-purple-700 font-indie-flower text-xl sm:text-[2rem]">
          {"Turn to"->React.string}
        </p>
        <div className="w-16 sm:w-20">
          {switch currentPlayer {
          | Cross => <Cross />
          | Circle => <Circle />
          }}
        </div>
      </div>
      <BoardGame board onCellClick />
    </div>
  </main>
}
