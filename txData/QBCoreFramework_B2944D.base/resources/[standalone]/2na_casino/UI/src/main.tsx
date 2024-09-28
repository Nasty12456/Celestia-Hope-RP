import React from "react";
import ReactDOM from "react-dom/client";

import App from "./App.tsx";

import { CasinoState } from "./context/CasinoContext";

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <CasinoState>
      <App />
    </CasinoState>
  </React.StrictMode>
);
