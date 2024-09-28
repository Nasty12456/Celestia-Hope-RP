import { Routes, Route, HashRouter } from "react-router-dom";

import Home from "./pages/Home";
import Wallet from "./pages/Wallet";
import Games from "./pages/Games";

import Crash from "./pages/Games/Crash";
import Mines from "./pages/Games/Mines";

import "./styles/globals.scss";
import Plinko from "./pages/Games/Plinko";
import Dice from "./pages/Games/Dice";
import Roulette from "./pages/Games/Roulette";
import Slot from "./pages/Games/Slot";

function App() {
  return (
    <div className="container">
      <div className="wrapper">
        <HashRouter>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/wallet" element={<Wallet />} />
            <Route path="/games" element={<Games />} />

            <Route path="/games/crash" element={<Crash />} />
            <Route path="/games/mines" element={<Mines />} />
            <Route path="/games/plinko" element={<Plinko />} />
            <Route path="/games/dice" element={<Dice />} />
            <Route path="/games/roulette" element={<Roulette />} />
            <Route path="/games/slot" element={<Slot />} />
          </Routes>
        </HashRouter>
      </div>
    </div>
  );
}

export default App;
