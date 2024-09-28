import {
  CSSProperties,
  Fragment,
  useEffect,
  useState,
  useRef,
  useContext,
} from "react";
import Navbar from "../../components/Navbar";

import BetMenu, { BetMenuSection } from "../../components/BetMenu";

import styles from "../../styles/Dice.game.module.scss";
import Button, { ButtonState } from "../../components/Button";
import BetInput from "../../components/BetInput";

import { FaDiceD6 } from "react-icons/fa";

import SendCasinoData from "../../utils/SendCasinoData";
import { CasinoContext } from "../../context/CasinoContext";

function Dice() {
  const [sliderValue, setSliderValue] = useState<number>(50.0);
  const [rollOver, setRollOver] = useState<number>(0.0);
  const [multiplier, setMultiplier] = useState<number>(0.0);
  const [winChance, setWinChance] = useState<number>(0.0);

  const [profitOnWin, setProfitOnWin] = useState<number>(0.0);
  const [currentBet, setCurrentBet] = useState<number>(0.0);

  const [showDiceResult, setShowDiceResult] = useState<boolean>(false);
  const [diceResult, setDiceResult] = useState<number>(50.0);

  const { balance } = useContext(CasinoContext);

  const diceFade = useRef<null | number>(null);
  const initialDice = useRef<boolean>(false);

  useEffect(() => {
    setProfitOnWin((currentBet * multiplier)?.toFixed(2) as unknown as number);
  }, [currentBet]);

  useEffect(() => {
    const newWinChance = (100 - sliderValue)?.toFixed(2) as unknown as number;
    const newRollOver = parseFloat(sliderValue as unknown as string)?.toFixed(
      4
    ) as unknown as number;
    const newMultiplier = (1 + newRollOver / newWinChance)?.toFixed(
      4
    ) as unknown as number;
    setWinChance(newWinChance);
    setRollOver(newRollOver);
    setMultiplier(newMultiplier);
    setProfitOnWin(
      (currentBet * newMultiplier)?.toFixed(2) as unknown as number
    );
  }, [sliderValue]);

  const playGame = async () => {
    if (currentBet <= 0 || currentBet > (balance || 0)) return;

    setShowDiceResult(true);

    SendCasinoData("MakeBetOnGame", {
      game: "DICE",
      data: {
        betAmount: currentBet,
      },
    });

    initialDice.current = true;

    const diceResult = parseFloat((Math.random() * 100)?.toFixed(2));

    setDiceResult(diceResult);

    if (diceFade.current) {
      clearTimeout(diceFade.current);
    }

    diceFade.current = setTimeout(async () => {
      SendCasinoData("SendGameResult", {
        game: "DICE",
        data: {
          betAmount: currentBet,
          result: diceResult,
          rollOver: rollOver, // ! aka Lose chance
          winChance: winChance,
        },
      });

      setShowDiceResult(false);
    }, 1400);
  };

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
      <Navbar disableNavigation={showDiceResult} />

      <div className={styles.container}>
        <BetMenu
          style={
            {
              "--betMenuHeight": "fit-content",
              "--chatHeight": "56%",
            } as CSSProperties
          }
          title="Dice"
        >
          <BetMenuSection>
            <p>Bet amount</p>
            <BetInput
              onChange={(val: number) => {
                setCurrentBet(val || 0.0);
              }}
              value={currentBet}
              placeholder="Make a bet ex (15, 100, 1000)"
            />
          </BetMenuSection>

          <BetMenuSection>
            <p>Profit on win</p>
            <input readOnly value={profitOnWin} type="number" />
          </BetMenuSection>

          <Button
            style={{
              marginBottom: "0",
              marginTop: "0",
            }}
            state={showDiceResult ? ButtonState.Loading : ButtonState.Default}
            onClick={playGame}
          >
            Make a bet!
          </Button>
        </BetMenu>

        <div className={styles.game}>
          <div className={styles.diceContainer}>
            <div className={styles.diceWrapper}>
              <div
                style={{
                  display: initialDice.current ? "" : "none",
                  left: `${diceResult}%`,
                }}
                className={
                  styles.diceResult +
                  ` ${showDiceResult ? "" : styles.diceResultFade}`
                }
              >
                <FaDiceD6 className={styles.diceResultIcon} />
                <p
                  style={{
                    color: diceResult > rollOver ? "" : "#da4444",
                  }}
                >
                  {diceResult}
                </p>
              </div>
              <div className={styles.dicePercentages}>
                <div
                  style={{
                    marginLeft: "0%",
                  }}
                  className={styles.percentage}
                >
                  0
                </div>
                <div
                  style={{
                    left: "25%",
                    marginLeft: "-2%",
                  }}
                  className={styles.percentage}
                >
                  25
                </div>
                <div
                  style={{
                    left: "50%",
                    marginLeft: "-1.9%",
                  }}
                  className={styles.percentage}
                >
                  50
                </div>
                <div
                  style={{
                    left: "75%",
                    marginLeft: "-1.9%",
                  }}
                  className={styles.percentage}
                >
                  75
                </div>
                <div
                  style={{
                    left: "100%",
                    marginLeft: "-3.5%",
                  }}
                  className={styles.percentage}
                >
                  100
                </div>
              </div>
              <div
                style={
                  {
                    "--colorLowPercentage": `${sliderValue}%`,
                  } as CSSProperties
                }
                className={styles.diceBackground}
              >
                <div className={styles.diceBackgroundLow}></div>
                <div className={styles.diceBackgroundHigh}></div>
              </div>
              <input
                className={styles.diceSlider}
                value={sliderValue}
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                onChange={(e: any) => {
                  if (showDiceResult) return;
                  setSliderValue(e?.target?.value);
                }}
                type="range"
                min={2}
                max={98}
                step={0.01}
              />
            </div>
          </div>

          <div className={styles.gameStats}>
            <div className={styles.gameStat}>
              <p>Multiplier</p>
              <input readOnly value={multiplier} type="number" />
            </div>
            <div className={styles.gameStat}>
              <p>Roll Over</p>
              <input readOnly value={rollOver} type="number" />
            </div>
            <div className={styles.gameStat}>
              <p>Win Chance</p>
              <input readOnly value={winChance} type="number" />
            </div>
          </div>
        </div>
      </div>
    </Fragment>
  );
}

export default Dice;
