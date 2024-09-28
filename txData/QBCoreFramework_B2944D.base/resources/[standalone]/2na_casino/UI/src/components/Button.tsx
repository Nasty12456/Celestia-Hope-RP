import { CSSProperties, PropsWithChildren } from "react";

import styles from "../styles/Button.module.scss";
import Loader from "./Loader";

export enum ButtonState {
  Default = "0",
  Loading = "1",
  Disabled = "2",
}

function Button({
  children,
  className,
  state = ButtonState.Default,
  style = {},
  loaderStyle = {},
  onClick = () => {},
}: {
  state?: ButtonState;
  className?: string;
  style?: CSSProperties;
  loaderStyle?: CSSProperties;
  onClick?: () => void;
} & PropsWithChildren) {
  return (
    <div
      style={
        {
          ...style,
          "--borderColors":
            state == ButtonState.Disabled || state == ButtonState.Loading
              ? "transparent"
              : "",

          color: state == ButtonState.Disabled ? "#9c9c9c" : "",
          textShadow: state == ButtonState.Disabled ? "unset" : "",
          cursor: state == ButtonState.Disabled ? "not-allowed" : "",
        } as CSSProperties
      }
      onClick={() => {
        if (
          state != ButtonState.Disabled &&
          state != ButtonState.Loading &&
          onClick
        )
          onClick();
      }}
      className={`${styles.container}${className ? " " + className : ""}`}
    >
      {state == ButtonState.Loading ? (
        <Loader
          style={{ "--size": "1.8vh", ...loaderStyle } as CSSProperties}
        />
      ) : (
        children
      )}

      <div
        style={{
          display: state == ButtonState.Loading ? "" : "none",
        }}
        className={styles.buttonLoading}
      ></div>
    </div>
  );
}

export default Button;
