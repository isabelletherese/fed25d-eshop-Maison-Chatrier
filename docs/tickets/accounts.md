## 04: Sign in and out

**Owner:** Accounts   **User stories:** A2   **Blocked by:** 01

### What to build

Let shoppers sign in and out and give Orders a shared way to identify the signed-in shopper. Carry the checkout destination through sign-in. Verify the session and return destination here, then check the full checkout and My orders browser flows with 08 and 09.

### Acceptance criteria

- [ ] Open checkout while signed out, sign in, and return to checkout with the bag intact.
- [ ] Enter incorrect credentials and see a clear error.
- [ ] Sign out and open My orders. Sign-in is required.

### Done when

- [ ] Every criterion passes, checked by hand, and the tests and the build pass.
- [ ] Run the Vitest integration test against the dev server and observe it fail when the covered behavior is temporarily broken. Restore the behavior and verify the test passes.
- [ ] Record the output of `npm test`, `npm run build`, and `npm run lint`, and explain how to verify the ticket in the browser.

## 05: Register and confirm an email

**Owner:** Accounts   **User stories:** A1   **Blocked by:** 04

### What to build

Let visitors register, confirm their email, and sign in. Preserve the checkout destination when registration starts there.

### Acceptance criteria

- [ ] Register and see a prompt to check email. Confirm the address using the email link, then sign in with the registered credentials.
- [ ] Try to sign in before confirming the email and see a message to confirm it first.
- [ ] Start registration with checkout as the return destination and verify the confirmation flow preserves it.

### Done when

- [ ] Every criterion passes, checked by hand, and the tests and the build pass.
- [ ] Run the Vitest integration test against the dev server and observe it fail when the covered behavior is temporarily broken. Restore the behavior and verify the test passes.
- [ ] Record the output of `npm test`, `npm run build`, and `npm run lint`, and explain how to verify the ticket in the browser.
