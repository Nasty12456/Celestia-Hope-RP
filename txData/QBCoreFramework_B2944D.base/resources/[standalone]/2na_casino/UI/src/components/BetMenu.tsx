import { CSSProperties, PropsWithChildren } from "react";

import styles from "../styles/BetMenu.module.scss";
import Chat from "./Chat";

export function BetMenuSection(props: PropsWithChildren) {
  return <div className={styles.betSection}>{props.children}</div>;
}

function BetMenu({
  className,
  style,
  betMenuStyle,
  title,
  children,
}: {
  style?: CSSProperties;
  betMenuStyle?: CSSProperties;
  className?: string;
  title: string;
} & PropsWithChildren) {
  return (
    <div
      style={style}
      className={`${styles.container} ${className ? " " + className : ""}}`}
    >
      <div style={betMenuStyle} className={styles.betMenuContainer}>
        <div className={styles.title}>{title}</div>
        <div className={styles.content}>{children}</div>
      </div>
      <Chat />
    </div>
  );
}

export default BetMenu;
