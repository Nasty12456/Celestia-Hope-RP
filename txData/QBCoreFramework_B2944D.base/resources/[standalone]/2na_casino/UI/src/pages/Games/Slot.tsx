import { CSSProperties, Fragment, useRef, useState } from "react";
import Navbar from "../../components/Navbar";

import styles from "../../styles/Slot.game.module.scss";
import BetMenu, { BetMenuSection } from "../../components/BetMenu";
import Button, { ButtonState } from "../../components/Button";
import BetInput from "../../components/BetInput";

import gsap from "gsap";

import {
  GiAmericanShield,
  GiCutDiamond,
  GiBurningMeteor,
  GiCardJackDiamonds,
  GiCrossedPistols,
  GiGClef,
  GiChessKnight,
  GiClubs,
} from "react-icons/gi";

import Wait from "../../utils/Wait";

import $ from "jquery";
import SendCasinoData from "../../utils/SendCasinoData";

const content: { [k: string]: JSX.Element } = {
  GiAmericanShield: <GiAmericanShield id="slot_shield" />,
  GiCutDiamond: <GiCutDiamond id="slot_diamond" />,
  GiBurningMeteor: <GiBurningMeteor id="slot_meteor" />,
  GiCardJackDiamonds: <GiCardJackDiamonds id="slot_card" />,
  GiCrossedPistols: <GiCrossedPistols id="slot_pistols" />,
  GiGClef: <GiGClef id="slot_clef" />,
  GiChessKnight: <GiChessKnight id="slot_chess" />,
  GiClubs: <GiClubs id="slot_club" />,
};

export const createSlotContent = () => {
  let availableContent = Object.getOwnPropertyNames(content);
  const execAmount = availableContent.length;

  const slotContent = [];

  for (let i = 0; i < execAmount; i++) {
    const rand = Math.floor(Math.abs(Math.random() * availableContent.length));

    slotContent.push(content[availableContent[rand]]);

    availableContent = availableContent.filter(
      (x) => x != availableContent[rand]
    );
  }

  return slotContent;
};

export function SlotColContent({ content }: { content: JSX.Element[] }) {
  return (
    <div className={styles.slotColContent}>
      {content.map((data, i) => {
        return (
          <div key={i} id={data.props.id} className={styles.colContent}>
            {data}
            <div id={data.props.id} className={styles.colContentLight}></div>
          </div>
        );
      })}
    </div>
  );
}

function Slot() {
  const [currentBet, setCurrentBet] = useState<number>(0);
  const [gameInProgress, setGameInProgress] = useState<boolean>(false);

  const winningNumberRef = useRef<{ slotId: number; item: string }[]>([]);

  const [colContent1, setContent1] = useState([
    ...createSlotContent(),
    ...createSlotContent(),
  ]);
  const [colContent2, setContent2] = useState([
    ...createSlotContent(),
    ...createSlotContent(),
  ]);
  const [colContent3, setContent3] = useState([
    ...createSlotContent(),
    ...createSlotContent(),
  ]);
  const [colContent4, setContent4] = useState([
    ...createSlotContent(),
    ...createSlotContent(),
  ]);
  const [colContent5, setContent5] = useState([
    ...createSlotContent(),
    ...createSlotContent(),
  ]);

  const spinSlotCol = (targetCol: string, crashDelay: number) => {
    switch (targetCol.slice(targetCol.length - 2, targetCol.length - 1)) {
      case "1":
        setContent1([...createSlotContent(), ...createSlotContent()]);
        break;
      case "2":
        setContent2([...createSlotContent(), ...createSlotContent()]);
        break;
      case "3":
        setContent3([...createSlotContent(), ...createSlotContent()]);
        break;
      case "4":
        setContent4([...createSlotContent(), ...createSlotContent()]);
        break;
      case "5":
        setContent5([...createSlotContent(), ...createSlotContent()]);
        break;
    }

    const repeatSpin = (target: string) => {
      gsap.set(target, {
        top: "-105vh",
      });
      gsap.to(target, {
        top: "105vh",
        bottom: "unset",
        ease: "none",
        duration: 2,
        delay: 0.03,
        onComplete: () => repeatSpin(target),
      });
    };

    gsap.set(`${targetCol} .${styles.slotColContent}:nth-child(2)`, {
      top: "-105vh",
    });

    gsap.set(`${targetCol} .${styles.slotColContent}:nth-child(1)`, {
      top: "0",
    });

    gsap.to(`${targetCol} .${styles.slotColContent}:nth-child(1)`, {
      top: "105vh",
      duration: 1,
      ease: "none",
      onComplete: () =>
        repeatSpin(`${targetCol} .${styles.slotColContent}:nth-child(1)`),
    });

    gsap.to(`${targetCol} .${styles.slotColContent}:nth-child(2)`, {
      top: "105vh",
      ease: "none",
      duration: 2,
      delay: 0.025,
      onComplete: () =>
        repeatSpin(`${targetCol} .${styles.slotColContent}:nth-child(2)`),
    });

    setTimeout(async () => {
      const targetLocation =
        ($(targetCol).offset()?.top as number) +
        ($(targetCol).height() as number) / 2 -
        (window.innerHeight * 3) / 100;

      // eslint-disable-next-line no-constant-condition
      while (true) {
        let closestChild: HTMLElement | null = null;

        $(`${targetCol} .${styles.slotColContent}:nth-child(2)`)
          .children()
          .each((_, colChild: HTMLElement) => {
            if (
              Math.abs(($(colChild).offset()?.top as number) - targetLocation) <
              Math.abs(
                ($(closestChild as HTMLElement).offset()?.top || 0) -
                  targetLocation
              )
            ) {
              closestChild = colChild;
            }
          });

        $(`${targetCol} .${styles.slotColContent}:nth-child(1)`)
          .children()
          .each((_, colChild) => {
            if (
              Math.abs(($(colChild).offset()?.top as number) - targetLocation) <
              Math.abs(
                ($(closestChild as HTMLElement).offset()?.top || 0) -
                  targetLocation
              )
            ) {
              closestChild = colChild;
            }
          });

        if (
          Math.abs(
            (($(closestChild as unknown as HTMLElement).offset()
              ?.top as number) || 0) - targetLocation
          ) < 1
        ) {
          gsap.killTweensOf(
            `${targetCol} .${styles.slotColContent}:nth-child(2)`
          );
          gsap.killTweensOf(
            `${targetCol} .${styles.slotColContent}:nth-child(1)`
          );

          const winningItem = $(closestChild as unknown as HTMLElement).attr(
            "id"
          ) as string;

          winningNumberRef.current.push({
            slotId: parseInt(
              targetCol.slice(targetCol.length - 2, targetCol.length - 1)
            ),
            item: winningItem,
          });

          break;
        }

        await Wait(1);
      }
    }, crashDelay);
  };

  const spinSlotWheel = async () => {
    if (currentBet <= 0) return;

    SendCasinoData("MakeBetOnGame", {
      game: "SLOT",
      data: {
        betAmount: currentBet,
      },
    });

    setGameInProgress(true);

    winningNumberRef.current = [];

    let maxSlotCrashDelay = 0;
    for (
      let i = 0;
      i < document.getElementsByClassName(styles.slotColumn).length;
      i++
    ) {
      const startDelay = Math.random() * 800;
      let crashDelay = Math.random() * 2500;

      if (crashDelay < 1200) crashDelay = crashDelay + 1000;

      if (startDelay + crashDelay > maxSlotCrashDelay)
        maxSlotCrashDelay = startDelay + crashDelay;

      setTimeout(
        () =>
          spinSlotCol(`.${styles.slotColumn}:nth-child(${i + 1})`, crashDelay),
        startDelay
      );
    }

    setTimeout(async () => {
      SendCasinoData("SendGameResult", {
        game: "SLOT",
        data: {
          betAmount: currentBet,
          slots: winningNumberRef.current,
        },
      });

      setGameInProgress(false);
    }, maxSlotCrashDelay + 500);
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

      <Navbar disableNavigation={gameInProgress} />

      <div className={styles.container}>
        <BetMenu
          style={
            {
              "--betMenuHeight": "fit-content",
              "--chatHeight": "64%",
            } as CSSProperties
          }
          title="SLOT"
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
            state={gameInProgress ? ButtonState.Loading : ButtonState.Default}
            onClick={() => {
              spinSlotWheel();
            }}
            style={{
              marginBottom: "1vh",
            }}
          >
            Spin!
          </Button>
        </BetMenu>

        <div className={styles.game}>
          <div className={styles.slot}>
            <div className={styles.slotColumn}>
              <SlotColContent content={colContent1.slice(0, 8)} />
              <SlotColContent content={colContent1.slice(8)} />
            </div>
            <div className={styles.slotColumn}>
              <SlotColContent content={colContent2.slice(0, 8)} />
              <SlotColContent content={colContent2.slice(8)} />
            </div>
            <div className={styles.slotColumn}>
              <SlotColContent content={colContent3.slice(0, 8)} />
              <SlotColContent content={colContent3.slice(8)} />
            </div>
            <div className={styles.slotColumn}>
              <SlotColContent content={colContent4.slice(0, 8)} />
              <SlotColContent content={colContent4.slice(8)} />
            </div>
            <div className={styles.slotColumn}>
              <SlotColContent content={colContent5.slice(0, 8)} />
              <SlotColContent content={colContent5.slice(8)} />
            </div>
          </div>
        </div>
      </div>
    </Fragment>
  );
}

export default Slot;
