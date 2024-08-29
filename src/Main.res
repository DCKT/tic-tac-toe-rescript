%%raw(`import './global.css'`)
let client = ReactDOM.Client.createRoot(ReactDOM.querySelector("#root")->Option.getUnsafe)

client->ReactDOM.Client.Root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
