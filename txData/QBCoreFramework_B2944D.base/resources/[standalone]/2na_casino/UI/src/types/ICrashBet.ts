export default interface ICrashBet {
  serverId: number;
  owner: string;
  amount: number;
  multiplier: string;
  cashOut: number | null;
}
