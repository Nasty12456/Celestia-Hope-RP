import {
  CSSProperties,
  Fragment,
  useContext,
  useEffect,
  useState,
} from "react";
import Navbar from "../../components/Navbar";

import styles from "../../styles/Plinko.game.module.scss";
import BetMenu, { BetMenuSection } from "../../components/BetMenu";

import $ from "jquery";
import Select from "../../components/Select";
import Button, { ButtonState } from "../../components/Button";
import { CasinoContext } from "../../context/CasinoContext";

import gsap from "gsap";
import BetInput from "../../components/BetInput";
import Wait from "../../utils/Wait";
import SendCasinoData from "../../utils/SendCasinoData";

function Plinko() {
  const casinoData = useContext(CasinoContext);
  const [rowAmount, setRowAmount] = useState<number>(13);
  const [gameInProgress, setGameInProgress] = useState<boolean>(false);
  const [currentBet, setCurrentBet] = useState<number>(0.0);
  const multiplierData: { [k: number]: number[] } = {
    8: [5.6, 2.1, 1.1, 1, 0.5, 1, 1.1, 2.1, 5.6],
    9: [5.6, 2, 1.6, 1, 0.7, 0.7, 1, 1.6, 2, 5.6],
    10: [8.9, 3, 1.4, 1.1, 1, 0.5, 1, 1.1, 1.4, 3, 8.9],
    11: [8.4, 3, 1.9, 1.3, 1, 0.7, 0.7, 1, 1.3, 1.9, 3, 8.4],
    12: [10, 3, 1.6, 1.4, 1.1, 1, 0.5, 1, 1.1, 1.4, 1.6, 3, 10],
    13: [8.1, 4, 3, 1.9, 1.2, 0.9, 0.7, 0.7, 0.9, 1.2, 1.9, 3, 4, 8.1],
    14: [7.1, 4, 1.9, 1.4, 1.3, 1.1, 1, 0.5, 1, 1.1, 1.3, 1.4, 1.9, 4, 7.1],
    15: [15, 8, 3, 2, 1.5, 1.1, 1, 0.7, 0.7, 1, 1.1, 1.5, 2, 3, 8, 15],
    16: [16, 9, 2, 1.4, 1.4, 1.2, 1.1, 1, 0.5, 1, 1.1, 1.2, 1.4, 1.4, 2, 9, 16],
  };
  const [ballAmount, setBallAmount] = useState<number>(25);

  const { balance } = useContext(CasinoContext);

  useEffect(() => {
    const lastRowLenth = $(`.${styles.row}:last-child`).width() || 0;

    $(`.${styles.multipliers}`).css(
      "width",
      `${((lastRowLenth + 20) * 100) / window.innerHeight}vh`
    );
  }, [rowAmount]);

  useEffect(() => {}, [casinoData]);

  const dropBall = async () => {
    const ballId = new Date().getTime();
    $(`.${styles.gameWrapper}`).append(
      `<div id="${ballId}" class="${styles.plinkoBall}"></div>`
    );

    const ball = $(`#${ballId}`);
    const ballCoords = $(`#${ballId}`).offset() as {
      left: number;
      top: number;
    };

    for (let i = 1; i < rowAmount + 1; i++) {
      let barrierToGo: string | null = null;

      if (i == 1) {
        ball.attr("data-barrier", 1);
        barrierToGo = `#plinko_row_${i} #plinko_barrier_1`;
      } else {
        const nextBarrierId =
          parseInt(ball.attr("data-barrier") as string) +
          Math.round(Math.random());

        barrierToGo = `#plinko_row_${i} #plinko_barrier_${nextBarrierId}`;
        ball.attr("data-barrier", nextBarrierId);
      }

      const offset = ($(window).height() as number) * 0.011;
      const barrierCoords = $(barrierToGo).offset() as {
        left: number;
        top: number;
      };

      if (i != 1)
        ball.queue(() => {
          ball
            .attr(
              "heading",
              ballCoords.left - barrierCoords.left > 0 ? "left" : "right"
            )
            .dequeue();
        });

      ball.animate(
        {
          top: barrierCoords.top - offset,
          left: barrierCoords.left,
        },
        300
      );

      await Wait(300);

      ball.removeAttr("heading");
    }

    let targetMultiplier: HTMLElement | null = null;
    $(`.${styles.multipliers}`)
      .children()
      .each((_, multiplierEl) => {
        if (!targetMultiplier) targetMultiplier = multiplierEl;
        else {
          const updatedBallCoords = $(`#${ballId}`).offset() as {
            left: number;
            top: number;
          };

          if (
            Math.abs(
              updatedBallCoords.left -
                ($(targetMultiplier).offset() as { left: number; top: number })
                  .left
            ) >
            Math.abs(
              updatedBallCoords.left -
                ($(multiplierEl).offset() as { left: number; top: number }).left
            )
          )
            targetMultiplier = multiplierEl;
        }
      });

    if (targetMultiplier) {
      const targetCoords = $(targetMultiplier).offset() as {
        left: number;
        top: number;
      };

      await gsap.to($(ball), {
        startAt: ball.offset(),
        top: targetCoords.top + ($(targetMultiplier).height() as number) / 2,
        left: targetCoords.left + ($(targetMultiplier).width() as number) / 2,
        ease: "power1.in",
        duration: 0.45,
        opacity: 0,
      });

      ball.remove();

      $(targetMultiplier).append(
        `<div class="${styles.multiplierEffect}"></div>`
      );

      setTimeout(() => {
        $(targetMultiplier as HTMLElement)
          ?.children(`.${styles.multiplierEffect}`)
          ?.remove();
      }, 1000);

      return $(targetMultiplier).attr("data-id");
    }
  };

  const playGame = async () => {
    if (currentBet <= 0 || (balance || 0) < currentBet) return;

    setGameInProgress(true);

    await SendCasinoData("MakeBetOnGame", {
      game: "PLINKO",
      data: {
        betAmount: currentBet,
        rowAmount: rowAmount,
        ballAmount: ballAmount,
      },
    });

    const ballResults = [];
    for (let i = 0; i < ballAmount; i++) {
      if (i == ballAmount - 1) {
        ballResults.push(await dropBall());
      } else {
        dropBall().then((d) => ballResults.push(d));
      }

      await Wait(150);
    }

    setGameInProgress(false);

    SendCasinoData("SendGameResult", {
      game: "PLINKO",
      data: {
        betAmount: currentBet,
        rowAmount: rowAmount,
        ballAmount: ballAmount,
        multipliers: ballResults,
      },
    });
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
              top: "-15vh",
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
              "--chatHeight": "44%",
            } as CSSProperties
          }
          betMenuStyle={{
            overflow: "unset",
          }}
          className={styles.betContainer}
          title="Plinko"
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

          <BetMenuSection>
            <p>Row amount</p>
            <Select
              disable={gameInProgress}
              optionSelected={(option) => {
                setRowAmount(parseInt(option.value));
              }}
              options={[
                { name: "11", value: "11", selected: rowAmount == 11 },
                { name: "12", value: "12", selected: rowAmount == 12 },
                { name: "13", value: "13", selected: rowAmount == 13 },
                {
                  name: "14",
                  value: "14",
                  selected: rowAmount == 14,
                },
                {
                  name: "15",
                  value: "15",
                  selected: rowAmount == 15,
                },
                {
                  name: "16",
                  value: "16",
                  selected: rowAmount == 16,
                },
              ]}
            />
          </BetMenuSection>

          <BetMenuSection>
            <p>Ball amount</p>
            <Select
              disable={gameInProgress}
              optionSelected={(option) => {
                setBallAmount(parseInt(option.value));
              }}
              options={[
                { name: "10", value: "10", selected: ballAmount == 10 },
                { name: "15", value: "15", selected: ballAmount == 15 },
                { name: "20", value: "20", selected: ballAmount == 20 },
                { name: "25", value: "25", selected: ballAmount == 25 },
              ]}
            />
          </BetMenuSection>

          <Button
            state={gameInProgress ? ButtonState.Loading : ButtonState.Default}
            style={{
              marginBottom: "0",
            }}
            onClick={playGame}
          >
            Make a bet!
          </Button>
        </BetMenu>

        <div className={styles.game}>
          <div className={styles.gameWrapper}>
            {(() => {
              const rows = [];

              for (let i = 0; i < rowAmount; i++) {
                const row = [];

                for (let y = 0; y < i + 1; y++) {
                  const scaleMultiplier = 1 - (rowAmount - 10) / 10;
                  row.push(
                    <div
                      key={y + 1}
                      id={`plinko_barrier_${y + 1}`}
                      style={{
                        height: `${1.3 * (scaleMultiplier + 0.4)}vh`,
                        width: `${1.3 * (scaleMultiplier + 0.4)}vh`,
                        margin: `${1 * scaleMultiplier}vh ${
                          3.8 * scaleMultiplier
                        }vh`,
                      }}
                      className={styles.plinkoBarrier}
                    ></div>
                  );
                }

                rows.push(row);
              }

              return rows.map((row, i) => {
                return (
                  <div
                    key={i}
                    id={`plinko_row_${i + 1}`}
                    className={styles.row}
                  >
                    {row}
                  </div>
                );
              });
            })()}
          </div>

          <div className={styles.multipliers}>
            {multiplierData[rowAmount].map((multiplier: number, i) => {
              return (
                <div key={i} data-id={multiplier} className={styles.multiplier}>
                  {multiplier}x
                </div>
              );
            })}
          </div>
        </div>
      </div>
    </Fragment>
  );
}

export default Plinko;
