import {
  PropsWithChildren,
  createContext,
  useEffect,
  useReducer,
  useState,
} from "react";
import ICasino from "../types/ICasino";
import isBrowserEnv from "../utils/isBrowserEnv";

export const CasinoContext = createContext<ICasino>({} as ICasino);

export const CasinoReducer = (
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  state: any,
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  action: { type: string; payload: any }
) => {
  switch (action.type) {
    case "UPDATE_DATA":
      return {
        ...state,
        ...action.payload,
      };

    default:
      return state;
  }
};

export const CasinoState = (props: PropsWithChildren) => {
  const [state, dispatch] = useReducer(CasinoReducer, {});
  const [showDisplay, setShowDisplay] = useState<boolean>(isBrowserEnv());

  const FetchCasinoData = async () => {
    if (isBrowserEnv()) {
      dispatch({
        type: "UPDATE_DATA",
        payload: {
          serverId: 1,
          balance: 14315,
          messages: ["Jack Smith: Hi there!", "Michael Kat: Hello!"],
          games: {
            crash: {
              history: [0.98, 1.3, 2.67],
              currentGame: {
                state: "AWAITING_BETS",
                multiplier: null,
                bets: [
                  {
                    serverId: 1,
                    owner: "Jack Smith",
                    amount: 240,
                    cashOut: null,
                    multiplier: null,
                  },
                ],
              },
            },
          },
        },
      });
    } else {
      const data = await fetch(`https://2na_casino/GetCasinoData`).catch(
        () => {}
      );

      if (!data) return;

      dispatch({
        type: "UPDATE_DATA",
        payload: data,
      });
    }
  };

  const UpdateContextData = (data: unknown) => {
    if (!data) return;

    dispatch({
      type: "UPDATE_DATA",
      payload: data,
    });
  };

  useEffect(() => {
    window.addEventListener(
      "message",
      (e: { data: { action: string; data: ICasino } }) => {
        switch (e.data.action) {
          case "ShowCasino":
            setShowDisplay(true);

            dispatch({
              type: "UPDATE_DATA",
              payload: e.data.data,
            });
            break;

          case "HideCasino":
            setShowDisplay(false);
            break;

          case "UpdateCasinoData":
            dispatch({
              type: "UPDATE_DATA",
              payload: e.data.data,
            });
            break;
        }
      }
    );
  });

  return (
    <CasinoContext.Provider
      value={{
        ...state,
        showingDisplay: showDisplay,
        FetchCasinoData,
        UpdateContextData,
      }}
    >
      {showDisplay ? props.children : <></>}
    </CasinoContext.Provider>
  );
};
