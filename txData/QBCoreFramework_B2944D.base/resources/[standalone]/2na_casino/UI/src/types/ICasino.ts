import ICrashBet from "./ICrashBet";

export default interface ICasino {
  chatTimeout: number;
  bannedWords: string[];
  showingDisplay: boolean;
  serverId: number;
  balance: number;
  messages: string[];
  games: {
    crash: {
      history: number[];
      currentGame: {
        state: string;
        bets: ICrashBet[];
        multiplier: number;
      };
    };
  };

  FetchCasinoData: () => void;
  UpdateContextData: (data: unknown) => void;
}
