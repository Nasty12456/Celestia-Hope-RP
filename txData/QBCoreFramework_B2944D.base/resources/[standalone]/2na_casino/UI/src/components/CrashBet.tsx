import styles from "../styles/CrashBet.module.scss";

function CrashBet({
  owner,
  amount,
  multiplier,
  cashOut,
}: {
  owner: string;
  amount: number;
  multiplier: string;
  cashOut: number | null;
}) {
  return (
    <div className={styles.container}>
      <div className={styles.betOwner}>{owner}</div>
      <div className={styles.betAmount}>
        {new Intl.NumberFormat("en-US", {
          style: "currency",
          currency: "usd",
        })
          .format(amount)
          .toString()}
      </div>
      <div className={styles.betMultiplier}>{multiplier || ""}x</div>
      <div className={styles.betCashOut}>
        {cashOut
          ? new Intl.NumberFormat("en-US", {
              style: "currency",
              currency: "usd",
            })
              .format(cashOut)
              .toString()
          : "x"}
      </div>
    </div>
  );
}

export default CrashBet;
