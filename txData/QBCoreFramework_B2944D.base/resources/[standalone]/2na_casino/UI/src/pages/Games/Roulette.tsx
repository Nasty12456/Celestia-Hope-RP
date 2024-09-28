import {
  CSSProperties,
  Fragment,
  useContext,
  useEffect,
  useRef,
  useState,
} from "react";
import Navbar from "../../components/Navbar";

import wheelImage from "../../images/roulette_wheel.png";

import styles from "../../styles/Roulette.game.module.scss";

import gsap from "gsap";

import BetMenu, { BetMenuSection } from "../../components/BetMenu";
import Button, { ButtonState } from "../../components/Button";
import BetInput from "../../components/BetInput";
import RouletteBoard from "../../components/RouletteBoard";
import Wait from "../../utils/Wait";
import SendCasinoData from "../../utils/SendCasinoData";
import { CasinoContext } from "../../context/CasinoContext";

function Roulette() {
  const ballTweenRef = useRef<gsap.core.Tween>();
  const wheelTweenRef = useRef<gsap.core.Tween>();

  const [gameInProgress, setGameInProgress] = useState<boolean>(false);
  const [currentBet, setCurrentBet] = useState<number>(0.0);

  const { balance } = useContext(CasinoContext);

  const rouletteWheelNumbers = [
    0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5,
    24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26,
  ];

  const [boardData, setBoardData] = useState<
    { chipId: string | number; chips: number[] }[]
  >([]);

  useEffect(() => {
    if (!wheelTweenRef.current)
      wheelTweenRef.current = gsap.to("#rouletteWheel", {
        rotation: 360,
        duration: 8,
        repeat: -1,
        ease: "none",
      });
  });

  const getDistanceToClosestNumber = () => {
    let wheelRotation = gsap.getProperty(
      "#rouletteWheel",
      "rotation"
    ) as number;
    if (wheelRotation < 0) {
      wheelRotation = 360 + wheelRotation;
    }
    let ballRotation = gsap.getProperty("#rouletteBall", "rotation") as number;
    if (ballRotation < 0) {
      ballRotation = 360 + ballRotation;
    }

    const updatedBallRotation = 360 - wheelRotation + ballRotation;

    const rouletteIndexDecimal =
      (updatedBallRotation > 360
        ? updatedBallRotation - 360
        : updatedBallRotation) /
      (360 / 37);

    return Math.abs(Math.ceil(rouletteIndexDecimal) - rouletteIndexDecimal);
  };

  const startGame = async () => {
    let totalBetAmount = 0;

    boardData.forEach((data) => {
      totalBetAmount = totalBetAmount + data.chips[0];
    });

    if (totalBetAmount <= 0 || totalBetAmount > balance) return;

    setGameInProgress(true);

    SendCasinoData("MakeBetOnGame", {
      game: "ROULETTE",
      data: {
        betAmount: boardData,
      },
    });

    ballTweenRef.current?.iteration(0);
    ballTweenRef.current?.endTime();
    document.getElementById("rouletteBall")?.removeAttribute("style");

    const tween = gsap.to("#rouletteBall", {
      rotation: -360,
      ease: "none",
      duration: 1,
      repeat: -1,
    });

    ballTweenRef.current = tween;

    setTimeout(async () => {
      gsap.to("#rouletteBall", {
        height: "70%",
        width: "70%",
        duration: 3,
        ease: "none",
      });

      setTimeout(async () => {
        while (tween.timeScale() >= 0.001) {
          tween.timeScale(tween.timeScale() - 0.001);
          await Wait(Math.random() / 25);
        }

        while (getDistanceToClosestNumber() > 0.1) {
          await Wait(1);
        }

        tween.timeScale(-0.125);

        let wheelRotation = gsap.getProperty(
          "#rouletteWheel",
          "rotation"
        ) as number;
        if (wheelRotation < 0) {
          wheelRotation = 360 + wheelRotation;
        }
        let ballRotation = gsap.getProperty(
          "#rouletteBall",
          "rotation"
        ) as number;
        if (ballRotation < 0) {
          ballRotation = 360 + ballRotation;
        }

        const updatedBallRotation = 360 - wheelRotation + ballRotation;

        let rouletteIndex = Math.round(
          (updatedBallRotation > 360
            ? updatedBallRotation - 360
            : updatedBallRotation) /
            (360 / 37)
        );

        if (rouletteIndex == 37) rouletteIndex = 0;

        tween.iteration(9999999);

        SendCasinoData("SendGameResult", {
          game: "ROULETTE",
          data: {
            betAmount: boardData,
            winningNumber: rouletteWheelNumbers[rouletteIndex],
          },
        });

        setBoardData([]);

        setGameInProgress(false);
      }, new Date().getMilliseconds() + 100);
    }, new Date().getMilliseconds() + 100);
  };

  const onBoardCellClick = (chipId: string | number) => {
    if (currentBet <= 0 || currentBet > balance) return;

    const cellDataExists = boardData.find((x) => x.chipId == chipId)
      ? true
      : false;

    if (cellDataExists) {
      for (let i = 0; i < boardData.length; i++) {
        if (boardData[i].chipId == chipId) {
          boardData[i].chips.push(currentBet);
          break;
        }
      }
    } else {
      boardData.push({ chipId: chipId, chips: [currentBet] });
    }

    setBoardData(boardData.slice());
  };

  return (
    <Fragment>
      <Fragment>
        <div
          className="lightEffect"
          style={
            {
              left: "0vh",
              bottom: "10vh",
              zIndex: 100,
              "--effectColor": "#2b12bbea",
            } as CSSProperties
          }
        ></div>
        <div
          className="lightEffect"
          style={
            {
              left: "5vh",
              bottom: "-10vh",
              "--effectColor": "#53e2ec99",
            } as CSSProperties
          }
        ></div>

        <div
          className="lightEffect"
          style={
            {
              right: "-20vh",
              top: "5vh",
              "--effectColor": "#2b12bbde",
              zIndex: 100,
            } as CSSProperties
          }
        ></div>
        <div
          className="lightEffect"
          style={
            {
              right: "0vh",
              top: "-30vh",
              "--effectColor": "#53e2ec99",
              filter: "blur(15vh)",
            } as CSSProperties
          }
        ></div>
      </Fragment>

      <Navbar disableNavigation={gameInProgress} />

      <div className={styles.container}>
        <BetMenu
          style={
            {
              "--betMenuHeight": "fit-content",
              "--chatHeight": "66%",
            } as CSSProperties
          }
          title="Roulette"
        >
          <BetMenuSection>
            <p>Bet amount</p>
            <BetInput
              value={currentBet}
              onChange={(val) => {
                setCurrentBet(val);
              }}
              placeholder="Make a bet ex (15, 100, 1000)"
            />
          </BetMenuSection>

          <Button
            style={{
              marginBottom: "1vh",
            }}
            state={gameInProgress ? ButtonState.Loading : ButtonState.Default}
            onClick={startGame}
          >
            Spin Wheel!
          </Button>
        </BetMenu>

        <div className={styles.game}>
          <div className={styles.wheel}>
            <div
              style={{
                display: "none",
              }}
              id="rouletteBall"
              className={styles.wheelBallPath}
            >
              <div className={styles.ball}></div>
            </div>
            <img
              id="rouletteWheel"
              className={styles.wheelImage}
              src={wheelImage}
            />
          </div>

          <RouletteBoard
            disabled={gameInProgress}
            onCellClick={onBoardCellClick}
            boardData={boardData}
            className={styles.rouletteBoard}
          />
        </div>
      </div>
    </Fragment>
  );
}

export default Roulette;
