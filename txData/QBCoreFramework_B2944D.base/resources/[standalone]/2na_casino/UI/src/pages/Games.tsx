import { CSSProperties, Fragment } from "react";
import { useNavigate } from "react-router-dom";

import Navbar from "../components/Navbar";

import styles from "../styles/Games.page.module.scss";

import { FaBomb, FaGem } from "react-icons/fa";
import { SlotColContent, createSlotContent } from "./Games/Slot";

import { FaDiceD6 } from "react-icons/fa";

import rouletteWheelImg from "../images/roulette_wheel.png";
import rouletteChip from "../images/roulette_chip.png";
import rouletteChip2 from "../images/roulette_chip_2.png";
import rouletteChip3 from "../images/roulette_chip_3.png";
import rouletteChip4 from "../images/roulette_chip_4.png";

function Games() {
  const navigate = useNavigate();

  return (
    <div className={styles.container}>
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

      <Navbar />

      <div className={styles.games}>
        <div onClick={() => navigate("/games/crash")} className={styles.game}>
          <h1>Crash</h1>
          <div className={styles.gameWrapper}>
            <div className={styles.graph}>
              <h1>2.6x</h1>
            </div>
          </div>
        </div>
        <div onClick={() => navigate("/games/slot")} className={styles.game}>
          <h1>Slot</h1>
          <div className={styles.gameWrapper}>
            <div className={styles.slot}>
              <div className={styles.slotCol}>
                <SlotColContent content={[...createSlotContent()]} />
              </div>
              <div className={styles.slotCol}>
                <SlotColContent content={[...createSlotContent()]} />
              </div>
              <div className={styles.slotCol}>
                <SlotColContent content={[...createSlotContent()]} />
              </div>
              <div className={styles.slotCol}>
                <SlotColContent content={[...createSlotContent()]} />
              </div>
              <div className={styles.slotCol}>
                <SlotColContent content={[...createSlotContent()]} />
              </div>
              <div className={styles.slotCol}>
                <SlotColContent content={[...createSlotContent()]} />
              </div>
            </div>
          </div>
        </div>

        <div onClick={() => navigate("/games/dice")} className={styles.game}>
          <h1>Dice</h1>
          <div className={styles.gameWrapper}>
            <div className={styles.dices}>
              <div
                style={{
                  left: "22vh",
                  top: "3vh",
                  transform: "rotate(30deg)",
                }}
                className={styles.dice}
              >
                <FaDiceD6 />
                <h1>12.43</h1>
              </div>

              <div
                style={{
                  left: "17vh",
                  top: "17vh",
                  transform: "rotate(130deg)",
                }}
                className={styles.dice}
              >
                <FaDiceD6 />
                <h1>12.43</h1>
              </div>

              <div
                style={
                  {
                    left: "2vh",
                    top: "7vh",
                    transform: "rotate(200deg)",
                    "--textColor": "#da4444",
                  } as CSSProperties
                }
                className={styles.dice}
              >
                <FaDiceD6 />
                <h1>12.43</h1>
              </div>

              <div
                style={
                  {
                    right: "2vh",
                    top: "28vh",
                    transform: "rotate(200deg)",
                    "--textColor": "#da4444",
                  } as CSSProperties
                }
                className={styles.dice}
              >
                <FaDiceD6 />
                <h1>12.43</h1>
              </div>

              <div
                style={{
                  left: "2vh",
                  top: "22vh",
                  transform: "rotate(200deg)",
                }}
                className={styles.dice}
              >
                <FaDiceD6 />
                <h1>12.43</h1>
              </div>
            </div>
          </div>
        </div>
        <div onClick={() => navigate("/games/mines")} className={styles.game}>
          <h1>Mines</h1>
          <div className={styles.gameWrapper}>
            <div className={styles.mines}>
              <div className={styles.mine}>
                <FaGem />
              </div>
              <div className={styles.mine}>
                <FaGem />
              </div>
              <div className={styles.mine}>
                <FaGem />
              </div>
              <div className={styles.mine}>
                <FaGem />
              </div>
              <div className={styles.mine}>
                <FaGem />
              </div>
              <div className={styles.mine}>
                <FaBomb />
              </div>
              <div className={styles.mine}>
                <FaGem />
              </div>
              <div className={styles.mine}>
                <FaGem />
              </div>
              <div className={styles.mine}>
                <FaGem />
              </div>
              <div className={styles.mine}>
                <FaGem />
              </div>
              <div className={styles.mine}>
                <FaGem />
              </div>
              <div className={styles.mine}>
                <FaBomb />
              </div>
            </div>
          </div>
        </div>

        <div onClick={() => navigate("/games/plinko")} className={styles.game}>
          <h1>Plinko</h1>
          <div className={styles.gameWrapper}>
            <div className={styles.plinko}>
              <div className={styles.plinkoRow}>
                <div className={styles.plinkoBarrier}></div>
              </div>
              <div className={styles.plinkoRow}>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
              </div>
              <div className={styles.plinkoRow}>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
              </div>
              <div className={styles.plinkoRow}>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
              </div>
              <div className={styles.plinkoRow}>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBall}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
              </div>
              <div className={styles.plinkoRow}>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
              </div>
              <div className={styles.plinkoRow}>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
                <div className={styles.plinkoBarrier}></div>
              </div>
            </div>
          </div>
        </div>
        <div
          onClick={() => navigate("/games/roulette")}
          className={styles.game}
        >
          <h1>Roulette</h1>
          <div className={styles.gameWrapper}>
            <div className={styles.roulette}>
              <div className={styles.rouletteChips}>
                <img
                  style={{
                    top: "4vh",
                  }}
                  src={rouletteChip}
                />
                <img
                  style={{
                    top: "17vh",
                    right: "10vh",
                  }}
                  src={rouletteChip2}
                />

                <img
                  style={{
                    left: "25vh",
                    top: "30vh",
                  }}
                  src={rouletteChip3}
                />
                <img
                  style={{
                    left: "10vh",
                    top: "30vh",
                  }}
                  src={rouletteChip4}
                />
              </div>
              <div className={styles.rouletteBall}></div>
              <img src={rouletteWheelImg} />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Games;
