import { CSSProperties } from "react";
import styles from "../styles/Loader.module.scss";

function Loader({ style }: { style?: CSSProperties }) {
  return <div style={style} className={styles.container}></div>;
}

export default Loader;
