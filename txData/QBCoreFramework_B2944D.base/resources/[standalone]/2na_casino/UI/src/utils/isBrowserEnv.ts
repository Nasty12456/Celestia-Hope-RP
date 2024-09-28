// eslint-disable-next-line @typescript-eslint/no-explicit-any
export default () => ((window as any)?.invokeNative ? false : true);
