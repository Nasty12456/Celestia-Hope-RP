import { CSSProperties } from "react";

import styles from "../styles/RouletteBoard.module.scss";

import rouletteChip from "../images/roulette_chip.png";
import rouletteChip2 from "../images/roulette_chip_2.png";
import rouletteChip3 from "../images/roulette_chip_3.png";
import rouletteChip4 from "../images/roulette_chip_4.png";
import rouletteChip5 from "../images/roulette_chip_5.png";

function Chip({ value }: { value: number }) {
  let chipSource = rouletteChip;

  if (value < 50) {
    chipSource = rouletteChip;
  } else if (value < 250) {
    chipSource = rouletteChip2;
  } else if (value < 500) {
    chipSource = rouletteChip3;
  } else if (value < 1000) {
    chipSource = rouletteChip4;
  } else if (value < 2000) {
    chipSource = rouletteChip5;
  }

  return (
    <div className={styles.chip}>
      <img src={chipSource} />
      <p>{value}</p>
    </div>
  );
}

function CellBtn({
  id,
  style,
  number,
  boardData,
  disabled,
  onClick,
}: {
  id?: string | number;
  style?: CSSProperties;
  number: number | string;
  boardData: { chipId: string | number; chips: number[] }[];
  disabled: boolean;
  onClick?: (id: string | number) => void;
}) {
  const redNumbers = [
    32, 19, 21, 25, 34, 27, 36, 30, 23, 5, 16, 1, 14, 9, 18, 7, 12, 3,
  ];
  const blackNumbers = [
    15, 4, 2, 17, 6, 13, 11, 8, 10, 24, 33, 20, 31, 22, 29, 28, 35, 26,
  ];
  const isWheelNumber =
    redNumbers.find((x) => x == number) ||
    blackNumbers.find((x) => x == number) ||
    number == 0;
  let extraClassName = null;

  if (isWheelNumber) {
    extraClassName = redNumbers.find((x) => x == number)
      ? styles.redCellBtn
      : number == 0
      ? styles.greenCellBtn
      : styles.blackCellBtn;
  } else extraClassName = styles.onlyBorderCellBtn;

  const chips =
    boardData.find(
      (x) =>
        x.chipId ==
        (isWheelNumber
          ? number
          : id || number.toString()?.replaceAll(" ", "").toLowerCase())
    )?.chips || [];

  return (
    <div
      data-id={isWheelNumber ? number : id}
      style={{
        ...style,
        filter: disabled ? "grayscale(1)" : "",
      }}
      className={`${styles.cellBtn} ${extraClassName}`}
      onClick={() => {
        if (onClick && chips.length != 1 && !disabled)
          onClick(
            isWheelNumber
              ? number
              : id || number.toString()?.replaceAll(" ", "").toLowerCase()
          );
      }}
    >
      <div className={styles.chips}>
        {chips.map((chip, i) => {
          return <Chip key={i} value={chip} />;
        })}
      </div>
      {number}
    </div>
  );
}

function RouletteBoard({
  style,
  className,
  boardData,
  disabled,
  onCellClick,
}: {
  style?: CSSProperties;
  className?: string;
  boardData: { chipId: string | number; chips: number[] }[];
  disabled: boolean;
  onCellClick: (chip: string | number) => void;
}) {
  return (
    <div
      style={style}
      className={`${styles.container}${className ? " " + className : ""}`}
    >
      <div className={styles.upper}>
        <div
          style={{
            width: "6%",
          }}
          className={styles.cell}
        >
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            style={{ height: "100%" }}
            number={0}
          />
        </div>
        <div className={styles.cell}>
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={3}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={6}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={9}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={2}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={5}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={8}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={1}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={4}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={7}
          />
        </div>
        <div className={styles.cell}>
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={12}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={15}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={18}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={11}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={14}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={17}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={10}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={13}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={16}
          />
        </div>
        <div className={styles.cell}>
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={21}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={24}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={27}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={20}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={23}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={26}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={19}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={22}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={25}
          />
        </div>
        <div className={styles.cell}>
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={30}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={33}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={36}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={29}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={32}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={35}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={28}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={31}
          />
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={34}
          />
        </div>
        <div
          style={{
            width: "6%",
          }}
          className={styles.cell}
        >
          <CellBtn
            disabled={disabled}
            id={"2:1_3"}
            onClick={onCellClick}
            boardData={boardData}
            number={"2:1"}
          />
          <CellBtn
            disabled={disabled}
            id={"2:1_2"}
            onClick={onCellClick}
            boardData={boardData}
            number={"2:1"}
          />
          <CellBtn
            disabled={disabled}
            id={"2:1_1"}
            onClick={onCellClick}
            boardData={boardData}
            number={"2:1"}
          />
        </div>
      </div>
      <div className={styles.lower}>
        <div className={styles.cell}>
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={"1 to 12"}
          />
          <div className={styles.miniCell}>
            <CellBtn
              disabled={disabled}
              onClick={onCellClick}
              boardData={boardData}
              number={"1 to 18"}
            />
            <CellBtn
              disabled={disabled}
              onClick={onCellClick}
              boardData={boardData}
              number={"Even"}
            />
          </div>
        </div>
        <div className={styles.cell}>
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={"13 to 24"}
          />
          <div className={styles.miniCell}>
            <CellBtn
              disabled={disabled}
              onClick={onCellClick}
              boardData={boardData}
              style={{
                borderColor: "#ff013c",
                backgroundColor: "#ff013c",
                color: "transparent",
              }}
              number={"RED"}
            />
            <CellBtn
              disabled={disabled}
              onClick={onCellClick}
              boardData={boardData}
              style={{
                borderColor: "#1e1f3a",
                backgroundColor: "#1e1f3a",
                color: "transparent",
              }}
              number={"BLACK"}
            />
          </div>
        </div>
        <div className={styles.cell}>
          <CellBtn
            disabled={disabled}
            onClick={onCellClick}
            boardData={boardData}
            number={"25 to 36"}
          />
          <div className={styles.miniCell}>
            <CellBtn
              disabled={disabled}
              onClick={onCellClick}
              boardData={boardData}
              number={"Odd"}
            />
            <CellBtn
              disabled={disabled}
              onClick={onCellClick}
              boardData={boardData}
              number={"19 to 36"}
            />
          </div>
        </div>
      </div>
    </div>
  );
}

export default RouletteBoard;
