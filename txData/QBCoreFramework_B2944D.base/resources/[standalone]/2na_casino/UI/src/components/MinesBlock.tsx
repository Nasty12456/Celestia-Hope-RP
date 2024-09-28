import { Fragment, useState, CSSProperties, useEffect } from "react";
import styles from "../styles/MinesBlock.module.scss";

import { FaBomb, FaGem } from "react-icons/fa";

function MinesBlock({
  id,
  isBomb,
  reset,
  onBlockClick,
}: {
  id: number;
  isBomb: boolean;
  reset: number;
  onBlockClick: (k: number, cb: () => void) => void;
}) {
  const [isClicked, setIsClicked] = useState<boolean>(false);

  const onInternalBlockClick = () => {
    onBlockClick(id, () => {
      setIsClicked(true);
    });
  };

  useEffect(() => {
    setIsClicked(false);
  }, [reset]);

  return (
    <div onClick={onInternalBlockClick} className={styles.container}>
      {isClicked ? (
        isBomb ? (
          <Fragment>
            <div
              style={{ "--glowColor": "#db3939" } as CSSProperties}
              className={styles.glow}
            ></div>
            <FaBomb className={styles.innerIcon} />
          </Fragment>
        ) : (
          <Fragment>
            <div className={styles.glow}></div>
            <FaGem className={styles.innerIcon} />
          </Fragment>
        )
      ) : (
        <Fragment></Fragment>
      )}
    </div>
  );
}

export default MinesBlock;
