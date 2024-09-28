export default async (route: string, payload: object) => {
  const data = await fetch(`https://2na_casino/${route}`, {
    method: "POST",
    body: JSON.stringify(payload),
    headers: {
      "Content-Type": "application/json",
    },
  }).catch(() => null);

  return data;
};
