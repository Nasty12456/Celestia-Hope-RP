import {
  Fragment,
  useState,
  useContext,
  useEffect,
  CSSProperties,
} from "react";

import Navbar from "../../components/Navbar";
import Bet from "../../components/CrashBet";

import { CasinoContext } from "../../context/CasinoContext";

import styles from "../../styles/Crash.game.module.scss";
import BetMenu from "../../components/BetMenu";
import Button, { ButtonState } from "../../components/Button";
import BetInput from "../../components/BetInput";
import SendCasinoData from "../../utils/SendCasinoData";

import $ from "jquery";

function Crash() {
  const { FetchCasinoData, serverId, games, balance } =
    useContext(CasinoContext);
  const [gameText, updateGameText] = useState<string>("");
  const [currentBet, setCurrentBet] = useState<number>(0.0);
  const [betInteractionLoading, setBetInteractionLoading] =
    useState<boolean>(false);

  useEffect(() => {
    FetchCasinoData();
    //eslint-disable-next-line
  }, []);

  const makeBetBtnClick = async () => {
    if (currentBet <= 0) return;

    if (
      games?.crash?.currentGame?.bets?.filter((x) => x.serverId == serverId)
        .length >= 1
    ) {
      if (games?.crash?.currentGame?.state != "STARTED") return;

      setBetInteractionLoading(true);

      await SendCasinoData("SendGameResult", {
        game: "CRASH",
        data: {
          betAmount: currentBet,
          multiplier: parseFloat(gameText.replace("x", "") || "0"),
        },
      });

      setBetInteractionLoading(false);
    } else {
      if (balance < currentBet) return;

      setBetInteractionLoading(true);

      await SendCasinoData("MakeBetOnGame", {
        game: "CRASH",
        data: {
          betAmount: currentBet,
        },
      });

      setBetInteractionLoading(false);
    }
  };

  useEffect(() => {
    (async () => {
      switch (games?.crash?.currentGame?.state) {
        case "AWAITING_BETS":
          updateGameText(`Awaiting Bets`);
          break;

        case "STARTED":
          updateGameText(
            `${games?.crash?.currentGame?.multiplier?.toFixed(2)}x`
          );

          $(`.${styles.gameChart}`).addClass(styles.animateGameChart);
          break;

        case "CRASHED":
          updateGameText("CRASHED!");
          $(`.${styles.gameChart}`).removeClass(styles.animateGameChart);
          break;
      }
    })();
  }, [games]);

  return (
    <Fragment>
      <Fragment>
        <div
          className="lightEffect"
          style={
            {
              left: "10vh",
              bottom: "-10vh",
              "--effectColor": "#2c12bb99",
            } as CSSProperties
          }
        ></div>
        <div
          className="lightEffect"
          style={
            {
              left: "-10vh",
              bottom: "10vh",
              "--effectColor": "#53e2ec99",
            } as CSSProperties
          }
        ></div>

        <div
          className="lightEffect"
          style={
            {
              right: "30vh",
              bottom: "20vh",
              "--effectColor": "#2b12bbde",
            } as CSSProperties
          }
        ></div>
        <div
          className="lightEffect"
          style={
            {
              right: "10vh",
              bottom: "10vh",
              "--effectColor": "#53e2ec99",
            } as CSSProperties
          }
        ></div>
      </Fragment>
      <Navbar />
      <div className={styles.container}>
        <BetMenu title="Bets">
          {games?.crash?.currentGame?.bets?.length == 0 ? (
            <p className={styles.betsNotAvailable}>
              There aren't any placed bets currently
            </p>
          ) : (
            <Fragment></Fragment>
          )}
          {games?.crash?.currentGame?.bets?.map((bet, i) => {
            return (
              <Bet
                key={i}
                owner={bet.owner}
                amount={bet.amount}
                multiplier={bet.multiplier}
                cashOut={bet.cashOut}
              />
            );
          })}
        </BetMenu>
        <div className={styles.gameFrame}>
          <div className={styles.gameHistory}>
            {games?.crash?.history
              ?.slice(-18)
              ?.reverse()
              ?.map((multiplier: number, i) => {
                return (
                  <div key={i} className={styles.gameHistoryMultiplier}>
                    {multiplier?.toFixed(2)}x
                  </div>
                );
              })}
          </div>
          <div className={styles.game}>
            <div className={styles.gameMultiplier}>{gameText}</div>
            <div className={styles.gameChart}></div>
          </div>
          <div className={styles.betToGame}>
            <BetInput
              value={currentBet}
              onChange={(val) => {
                setCurrentBet(val);
              }}
            />
            <Button
              state={
                betInteractionLoading
                  ? ButtonState.Loading
                  : ButtonState.Default
              }
              onClick={makeBetBtnClick}
              style={{ marginLeft: "1vh", width: "20vh" }}
            >
              {games?.crash?.currentGame?.bets?.filter(
                (x) => x.serverId == serverId
              ).length >= 1
                ? "Cash Out"
                : "Make a Bet!"}
            </Button>
          </div>
        </div>
      </div>
    </Fragment>
  );
}

export default Crash;
