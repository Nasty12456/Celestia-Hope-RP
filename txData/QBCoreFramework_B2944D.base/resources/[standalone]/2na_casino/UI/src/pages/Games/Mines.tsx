import { CSSProperties, Fragment, useContext, useState } from "react";

import Navbar from "../../components/Navbar";

import styles from "../../styles/Mines.game.module.scss";
import MinesBlock from "../../components/MinesBlock";
import BetMenu, { BetMenuSection } from "../../components/BetMenu";
import Select from "../../components/Select";
import Button from "../../components/Button";
import BetInput from "../../components/BetInput";
import SendCasinoData from "../../utils/SendCasinoData";
import { CasinoContext } from "../../context/CasinoContext";

function Mines() {
  const [currentBet, setCurrentBet] = useState<number>(0.0);
  const [mineAmount, setMineAmount] = useState<number>(2);

  const [gameInProgress, setGameInProgress] = useState<boolean>(false);
  const [mineLocations, setMineLocations] = useState<number[]>([]);

  const [reset, setReset] = useState<number>(0);

  const [blockClicked, setBlockClicked] = useState<number>(0);

  const { balance } = useContext(CasinoContext);

  const gameBtnClick = async () => {
    if (gameInProgress) {
      setGameInProgress(false);

      SendCasinoData("SendGameResult", {
        game: "MINES",
        data: {
          betAmount: currentBet,
          mineAmount: mineAmount,
          didWin: true,
          blockClicked: blockClicked,
        },
      });
    } else startGame();
  };

  const startGame = async () => {
    if (currentBet <= 0 || currentBet > balance) return;

    SendCasinoData("MakeBetOnGame", {
      game: "MINES",
      data: {
        betAmount: currentBet,

        mineAmount: mineAmount,
      },
    });

    setBlockClicked(0);
    setReset(Math.random());

    const mineLocs: number[] = [];

    for (let i = 0; i < mineAmount; i++) {
      const randomLoc = Math.floor(Math.random() * (25 - 1));

      if (!mineLocs.includes(randomLoc)) mineLocs.push(randomLoc);
      else i++;
    }

    setMineLocations(mineLocs);

    setGameInProgress(true);
  };

  const onMineBlockClick = async (id: number, cb: () => void) => {
    if (!gameInProgress) return;

    cb();

    setBlockClicked(blockClicked + 1);

    const isBomb = mineLocations.includes(id);

    if (isBomb) {
      setGameInProgress(false);

      SendCasinoData("SendGameResult", {
        game: "MINES",
        data: {
          betAmount: currentBet,
          mineAmount: mineAmount,
          didWin: false,
          blockClicked: blockClicked,
        },
      });
    } else return;
  };

  return (
    <Fragment>
      <Fragment>
        <div
          className="lightEffect"
          style={
            {
              left: "3vh",
              top: "22vh",
              zIndex: 100,
              "--effectColor": "#2b12bbea",
            } as CSSProperties
          }
        ></div>
        <div
          className="lightEffect"
          style={
            {
              left: "2vh",
              top: "34vh",
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
              "--chatHeight": "55%",
            } as CSSProperties
          }
          betMenuStyle={{
            overflow: "unset",
          }}
          className={styles.betContainer}
          title="Mines"
        >
          <BetMenuSection>
            <p>Bet amount</p>
            <BetInput
              onChange={(val) => {
                setCurrentBet(val);
              }}
              value={currentBet}
            />
          </BetMenuSection>

          <BetMenuSection>
            <p>Mine amount</p>
            <Select
              disable={gameInProgress}
              optionSelected={(opt) => setMineAmount(parseInt(opt.value))}
              options={[
                { name: "1", value: "1", selected: mineAmount == 1 },
                { name: "2", value: "2", selected: mineAmount == 2 },
                { name: "3", value: "3", selected: mineAmount == 3 },
                { name: "4", value: "4", selected: mineAmount == 4 },
                { name: "5", value: "5", selected: mineAmount == 5 },
                { name: "6", value: "6", selected: mineAmount == 6 },
                { name: "7", value: "7", selected: mineAmount == 7 },
                { name: "8", value: "8", selected: mineAmount == 8 },
                { name: "9", value: "9", selected: mineAmount == 9 },
              ]}
            />
          </BetMenuSection>

          <Button
            onClick={gameBtnClick}
            style={{
              marginBottom: "0",
            }}
          >
            {gameInProgress ? "Cash Out" : "Make a bet!"}
          </Button>
        </BetMenu>
        <div className={styles.game}>
          {(() => {
            const elemenets = [];
            for (let i = 0; i < 25; i++) {
              elemenets.push(
                <MinesBlock
                  reset={reset}
                  onBlockClick={onMineBlockClick}
                  isBomb={
                    mineLocations?.find((x) => x == i + 1) == null
                      ? false
                      : true
                  }
                  id={i + 1}
                  key={i}
                />
              );
            }

            return elemenets;
          })()}
        </div>
      </div>
    </Fragment>
  );
}

export default Mines;
