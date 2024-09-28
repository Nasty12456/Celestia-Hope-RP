import Button, { ButtonState } from "./Button";

import styles from "../styles/Chat.module.scss";
import { CSSProperties, useContext, useEffect, useState } from "react";
import { CasinoContext } from "../context/CasinoContext";
import SendCasinoData from "../utils/SendCasinoData";

import $ from "jquery";

function Chat() {
  const { bannedWords, chatTimeout, messages } = useContext(CasinoContext);

  const [chatInput, setChatInput] = useState<string>();
  const [chatInputFocus, setChatInputFocus] = useState<boolean>(false);
  const [buttonState, setButtonState] = useState<ButtonState>(
    ButtonState.Default
  );

  const chatSendBtnClick = async () => {
    if (!chatInput?.trim() || buttonState == ButtonState.Disabled) return;

    setButtonState(ButtonState.Loading);

    await SendCasinoData("SendMessage", { message: chatInput });

    setChatInput("");

    if (chatTimeout > 0) {
      setButtonState(ButtonState.Disabled);

      setTimeout(() => {
        setButtonState(ButtonState.Default);
      }, chatTimeout * 1000);
    } else {
      setButtonState(ButtonState.Default);
    }
  };

  useEffect(() => {
    const handleClick = (e: KeyboardEvent) => {
      if (e.key == "Enter" && chatInputFocus) chatSendBtnClick();
    };

    window.addEventListener("keydown", handleClick);

    return () => {
      window.removeEventListener("keydown", handleClick);
    };
  });

  useEffect(() => {
    $(`.${styles.messages}`).animate(
      {
        scrollTop: $(`.${styles.messages}`).prop("scrollHeight"),
      },
      200
    );
  }, [messages]);

  return (
    <div className={styles.container}>
      <div className={styles.title}>CHAT</div>
      <div className={styles.messages}>
        {messages?.map((message, i) => {
          const messageSplit = message.split(" ");

          for (let i = 0; i < messageSplit.length; i++) {
            if (bannedWords?.includes(messageSplit[i]))
              messageSplit[i] = "****";
          }

          return (
            <div key={i} className={styles.message}>
              {messageSplit.join(" ")}
            </div>
          );
        })}
      </div>
      <div className={styles.inputPart}>
        <input
          onFocus={() => {
            setChatInputFocus(true);
          }}
          onBlur={() => {
            setChatInputFocus(false);
          }}
          onChange={(e) => {
            setChatInput(e.target.value);
          }}
          value={chatInput || ""}
          type="text"
        />
        <Button
          state={buttonState}
          onClick={chatSendBtnClick}
          className={styles.sendBtn}
          loaderStyle={{ "--size": "1.6vh" } as CSSProperties}
        >
          Send
        </Button>
      </div>
    </div>
  );
}

export default Chat;
