import {
  CSSProperties,
  Fragment,
  useContext,
  useEffect,
  useState,
} from "react";

import styles from "../styles/Wallet.page.module.scss";
import Navbar from "../components/Navbar";

import { CasinoContext } from "../context/CasinoContext";

import BetInput from "../components/BetInput";

import { FaFacebook, FaInstagram } from "react-icons/fa";
import { FaDiscord, FaXTwitter } from "react-icons/fa6";
import Select from "../components/Select";
import Button from "../components/Button";
import SendCasinoData from "../utils/SendCasinoData";

function MyWallet() {
  const [depositVal, setDepositVal] = useState<number>(0.0);
  const [depositMethod, setDepositMethod] = useState<string>("bank");
  const [withdrawMethod, setWithdrawMethod] = useState<string>("bank");
  const [withdrawVal, setWithdrawVal] = useState<number>(0.0);

  const { FetchCasinoData, balance } = useContext(CasinoContext);

  useEffect(
    () => {
      FetchCasinoData();
    },
    //eslint-disable-next-line
    []
  );

  const depositMoneyBtnClick = () => {
    if (depositVal <= 0) return;

    SendCasinoData("DepositMoney", {
      amount: depositVal,
      method: depositMethod,
    });

    setDepositVal(0);
  };
  const withdrawMoneyBtnClick = () => {
    if (withdrawVal <= 0 || withdrawVal > balance) return;

    SendCasinoData("WithdrawMoney", {
      amount: withdrawVal,
      method: withdrawMethod,
    });

    setWithdrawVal(0);
  };

  return (
    <Fragment>
      <>
        <div
          className="lightEffect"
          style={
            {
              left: "0vh",
              top: "10vh",
              "--effectColor": "#2b12bbda",
            } as CSSProperties
          }
        ></div>
        <div
          className="lightEffect"
          style={
            {
              left: "20vh",
              top: "20vh",
              "--effectColor": "#53e2ec5d",
            } as CSSProperties
          }
        ></div>

        <div
          className="lightEffect"
          style={
            {
              right: "10vh",
              bottom: "-10vh",
              "--effectColor": "#2c12bb99",
            } as CSSProperties
          }
        ></div>
        <div
          className="lightEffect"
          style={
            {
              right: "-10vh",
              bottom: "10vh",
              "--effectColor": "#53e2ec99",
            } as CSSProperties
          }
        ></div>
      </>

      <Navbar />
      <div className={styles.container}>
        <div className={styles.wrapper}>
          <div className={styles.account}>
            <h1>Balance</h1>
            <BetInput
              hideButtons
              className={styles.accountBalance}
              value={balance}
            />
          </div>

          <div className={styles.socialMedia}>
            <h1>
              Follow &nbsp;&nbsp;&nbsp;<span id="us">us</span>&nbsp; on
              <br />
              <span id="social_media">social media</span>
            </h1>

            <div className={styles.socialMediaAccounts}>
              <FaDiscord />
              <FaInstagram />
              <FaFacebook />
              <FaXTwitter />
            </div>
          </div>

          <div className={styles.transaction}>
            <div className={styles.transactionHead}>
              <hr />
              <h1>Deposit</h1>
              <hr />
            </div>

            <div className={styles.transactionSection}>
              <p>Amount</p>
              <BetInput
                hideButtons
                value={depositVal}
                onChange={(val) => setDepositVal(val)}
              />
            </div>

            <div className={styles.transactionSection}>
              <p>Transaction Method</p>
              <Select
                optionSelected={(opt) => setDepositMethod(opt.value)}
                options={[
                  {
                    name: "Bank",
                    value: "bank",
                    selected: depositMethod == "bank",
                  },
                  {
                    name: "Cash",
                    value: "cash",
                    selected: depositMethod == "cash",
                  },
                ]}
              />
            </div>
            <Button onClick={depositMoneyBtnClick}>Deposit</Button>
          </div>

          <div className={styles.transaction}>
            <div className={styles.transactionHead}>
              <hr />
              <h1>Withdraw</h1>
              <hr />
            </div>

            <div className={styles.transactionSection}>
              <p>Amount</p>
              <BetInput
                hideButtons
                value={withdrawVal}
                onChange={(val) => setWithdrawVal(val)}
              />
            </div>

            <div className={styles.transactionSection}>
              <p>Transaction Method</p>
              <Select
                optionSelected={(opt) => setWithdrawMethod(opt.value)}
                options={[
                  {
                    name: "Bank",
                    value: "bank",
                    selected: withdrawMethod == "bank",
                  },
                  {
                    name: "Cash",
                    value: "cash",
                    selected: withdrawMethod == "cash",
                  },
                ]}
              />
            </div>
            <Button onClick={withdrawMoneyBtnClick}>Withdraw</Button>
          </div>
        </div>
      </div>
    </Fragment>
  );
}

export default MyWallet;
