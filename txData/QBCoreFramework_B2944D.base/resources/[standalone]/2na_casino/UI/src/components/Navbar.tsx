import styles from "../styles/Navbar.module.scss";

import { IoMdExit } from "react-icons/io";

import casinoLogo from "../images/logo_transparent.png";

import { useNavigate } from "react-router-dom";
import { CSSProperties, useContext } from "react";
import { CasinoContext } from "../context/CasinoContext";

import { FaWallet } from "react-icons/fa6";
import SendCasinoData from "../utils/SendCasinoData";

function Navbar({
  disableNavigation = false,
}: {
  disableNavigation?: boolean;
}) {
  const { balance } = useContext(CasinoContext);
  const navigate = useNavigate();

  const headTo = (path: string) => {
    if (!disableNavigation) navigate(path);
  };

  return (
    <div className={styles.container}>
      <div>
        <div className={styles.brand}>
          <img src={casinoLogo} />
        </div>
        <div className={styles.links}>
          <div
            onClick={() => headTo("/")}
            style={
              {
                color: disableNavigation ? "#a3a3a3" : "",
                "--cursorType": disableNavigation ? "not-allowed" : "",
              } as CSSProperties
            }
            className={styles.link}
          >
            Home
          </div>
          <div
            onClick={() => headTo("/wallet")}
            style={
              {
                color: disableNavigation ? "#a3a3a3" : "",
                "--cursorType": disableNavigation ? "not-allowed" : "",
              } as CSSProperties
            }
            className={styles.link}
          >
            Wallet
          </div>
          <div
            onClick={() => headTo("/games")}
            style={
              {
                color: disableNavigation ? "#a3a3a3" : "",
                "--cursorType": disableNavigation ? "not-allowed" : "",
              } as CSSProperties
            }
            className={styles.link}
          >
            Games
          </div>
        </div>
      </div>
      <div>
        <div
          onClick={() => {
            if (!disableNavigation) navigate("/wallet");
          }}
          className={styles.balance}
        >
          <FaWallet className={styles.balanceIcon} />

          <span id="account_balance">
            {new Intl.NumberFormat("en-US", {
              style: "currency",
              currency: "usd",
            })
              .format(balance || 0)
              .toString()}
          </span>
        </div>
        <div
          style={
            {
              "--cursorType": disableNavigation ? "not-allowed" : "",
            } as CSSProperties
          }
          onClick={() => SendCasinoData("HideCasino", {})}
          className={styles.exit}
        >
          <IoMdExit
            style={{
              color: disableNavigation ? "#a3a3a3" : "",
              "--cursorType": disableNavigation ? "not-allowed" : "",
            }}
          />
        </div>
      </div>
    </div>
  );
}

export default Navbar;
