interface IBetInput {
  value: number;
  placeholder?: string;
  className?: string;
  style?: CSSProperties;
  hideButtons?: boolean;
  onChange?: (val: number) => void;
}

import { CSSProperties, Fragment } from "react";
import styles from "../styles/BetInput.module.scss";

function BetInput({
  style,
  className,
  value,
  placeholder,
  hideButtons = false,
  onChange,
}: IBetInput) {
  return (
    <div
      style={style}
      className={`${styles.container}${className ? " " + className : ""}`}
    >
      <input
        disabled={hideButtons && value && !onChange ? true : false}
        type="text"
        onChange={(e) => {
          if (onChange) {
            if (!e.target.value) e.target.value = "0";

            if (isNaN(e.target.value as unknown as number)) return;

            if (e.target.value.endsWith("-")) {
              e.target.value = e.target.value.slice(
                0,
                e.target.value.length - 1
              );
            }

            if (e.target.value.startsWith("0") && e.target.value.length > 1)
              e.target.value = e.target.value.slice(1, e.target.value.length);

            if (parseFloat(e.target.value) < 0)
              (e.target.value as unknown as number) = Math.abs(
                parseFloat(e.target.value)
              );

            if (
              e.target.value.startsWith("0") &&
              e.target.value[1] &&
              e.target.value[1] != "."
            ) {
              e.target.value = "0." + e.target.value.slice(1);
            }

            if (e.target.value == "0") e.target.value = "0.00";

            if (
              e.target.value.length > 0 &&
              e.target.value.split(".")[1].length > 2 &&
              e.target.selectionStart == e.target.value.length
            ) {
              const betSplit = e.target.value.split(".");

              if (betSplit[0] == "0") betSplit[0] = betSplit[1].slice(-1);
              else betSplit[0] = betSplit[0] + betSplit[1].slice(-1);

              e.target.value = betSplit.join(".");
            }

            if (
              e.target.value.length > 0 &&
              e.target.value.split(".")[1].length == 1 &&
              e.target.selectionStart
            ) {
              const betSplit = e.target.value.split(".");

              betSplit[0] = betSplit[0].slice(0, betSplit[0].length - 1);

              e.target.value = betSplit.join(".");
            }

            onChange(parseFloat(e.target.value));
          }
        }}
        placeholder={placeholder}
        value={(value == 0 ? value.toFixed(2) : value?.toFixed(2)) || 0}
      />

      <div className={styles.buttons}>
        {!hideButtons ? (
          <Fragment>
            <div
              style={{
                fontSize: "1.9vh",
              }}
              onClick={() => {
                if (onChange) onChange(value / 2);
              }}
              className={styles.button}
            >
              ½
            </div>
            <div
              onClick={() => {
                if (onChange) onChange(value * 2);
              }}
              className={styles.button}
            >
              2x
            </div>
          </Fragment>
        ) : (
          <Fragment></Fragment>
        )}
      </div>
    </div>
  );
}

export default BetInput;
