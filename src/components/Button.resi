type color = [
  | #primary
  | #secondary
]

@react.component
let make: (
  ~onClick: ReactEvent.Mouse.t => unit=?,
  ~color: color,
  ~children: React.element,
) => React.element
