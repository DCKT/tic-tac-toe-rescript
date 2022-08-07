type color = [
  | #primary
  | #secondary
]

@react.component
let make = (~onClick=?, ~color: color, ~children) => {
  <button
    ?onClick
    className={cx([
      "px-4 py-2 rounded-md border font-semibold transition-transform duration-150 ease-linear hover:scale-110 text-base sm:text-xl",
      switch color {
      | #primary => "bg-purple-500 text-white border-purple-500 hover:bg-purple-700 hover:border-purple-700 "
      | #secondary => "bg-purple-100 text-purple-600 border-purple-100 hover:bg-purple-400 hover:border-purple-400 hover:text-white"
      },
    ])}>
    {children}
  </button>
}
