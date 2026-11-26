import { expect, test } from "vitest";

test("the homepage shows the shared Maison Chatrier storefront layout", async () => {
  const baseUrl = process.env.TEST_BASE_URL || "http://localhost:3000";
  const response = await fetch(new URL("/", baseUrl), { redirect: "manual" });

  expect(response.status).toBe(200);

  const html = await response.text();
  const header = html.match(/<header[\s>][\s\S]*?<\/header>/)?.[0] ?? "";
  const footer = html.match(/<footer[\s>][\s\S]*?<\/footer>/)?.[0] ?? "";
  expect(header).toContain("Maison Chatrier");
  expect(header).toContain('href="/collection"');
  expect(footer).toContain("Maison Chatrier");
});
