@react.component
let make = (~winner: option<BoardGame.player>, ~onRestartClick, ~onBackClick) => {
  <div className="absolute left-0 top-0 z-10 w-full h-full flex justify-center items-center">
    <div className="absolute w-full h-full bg-black opacity-50 animate-fadeIn50" />
    <div
      className="bg-white w-full mx-4 sm:mx-0 sm:w-[500px] text-center rounded-lg shadow p-8 z-20 animate-zoom flex flex-col gap-2">
      <h2
        className="text-[4rem] sm:text-[5rem] font-semibold font-indie-flower text-purple-600 uppercase">
        {"Game end"->React.string}
      </h2>
      <div>
        {switch winner {
        | None => "Equality"->React.string
        | Some(winner) =>
          <div className="flex flex-row items-center justify-center gap-2 text-purple-500">
            {switch winner {
            | Cross => <Cross />
            | Circle => <Circle />
            }}
            <p className="w-full text-[3rem] sm:text-[4rem] font-indie-flower text-left">
              {"wins"->React.string}
            </p>
          </div>
        }}
      </div>
      <div className="flex flex-row gap-4 justify-center items-center">
        <Button color=#primary onClick={_ => onRestartClick()}> {"Restart"->React.string} </Button>
        <Button color=#secondary onClick={_ => onBackClick()}>
          {"Go back to the menu"->React.string}
        </Button>
      </div>
    </div>
  </div>
}
