## 06: Manage the shopping bag

**Owner:** Orders   **User stories:** O1   **Blocked by:** 01

### What to build

Let visitors manage their bag and view current prices. Provide the add-to-bag handoff for Catalog using the product-size ID and quantity. Verify quotes with seeded sizes, then check adding from a product page with 07 and bag persistence through sign-in once 04 is available.

### Acceptance criteria

- [ ] Add two available sizes of the same garment and see two separate lines.
- [ ] Change a quantity or remove a line and see the total update.
- [ ] Refresh or sign in using the same browser and see the same selections.

### Done when

- [ ] Every criterion passes, checked by hand, and the tests and the build pass.
- [ ] Run the Vitest integration test against the dev server and observe it fail when the covered behavior is temporarily broken. Restore the behavior and verify the test passes.
- [ ] Record the output of `npm test`, `npm run build`, and `npm run lint`, and explain how to verify the ticket in the browser.

## 08: Place a demo order and view confirmation

**Owner:** Orders   **User stories:** O2, O3   **Blocked by:** 04, 06

### What to build

Let signed-in shoppers review their bag and place a demo order with a Swedish delivery address. Save the order and decrement stock together, then open the private confirmation. Verify the checkout sign-in return from 04 with the bag intact.

### Acceptance criteria

- [ ] See the current catalog prices and total in SEK. Enter a full name, street address, postcode, and city, then select **Place demo order**.
- [ ] Leave a required field blank and see which field needs attention.
- [ ] Place an order successfully and see the bag clear and the confirmation open. Availability for the purchased sizes decreases by the ordered quantities.
- [ ] Try to place an order for more units than are currently available. Checkout identifies the affected garment and size, leaves the bag intact, and creates no order.
- [ ] Open the confirmation and see the order number, each garment's name, size, quantity and unit price at purchase, and the total in SEK.
- [ ] Open another shopper's order URL and receive a 404 response.

### Done when

- [ ] Every criterion passes, checked by hand, and the tests and the build pass.
- [ ] Run the Vitest integration test against the dev server and observe it fail when the covered behavior is temporarily broken. Restore the behavior and verify the test passes.
- [ ] Record the output of `npm test`, `npm run build`, and `npm run lint`, and explain how to verify the ticket in the browser.

## 09: View order history and demo status

**Owner:** Orders   **User stories:** O4   **Blocked by:** 08

### What to build

Give signed-in shoppers a private order history with links to confirmations. Calculate demo statuses when the history is opened or refreshed. Verify sign-out from 04 by opening My orders after signing out.

### Acceptance criteria

- [ ] Open My orders and see only your orders, newest first, with the order number, date, total in SEK, and status.
- [ ] Select an order and see its confirmation. A shopper with no orders sees an empty state.
- [ ] Open or refresh My orders and see the status for the elapsed time since the order was placed.

| Time since placement | Status |
| --- | --- |
| Under 1 hour | Order placed |
| 1 hour to under 3 hours | Processing |
| 3 hours to under 24 hours | Shipped |
| 24 hours or more | Delivered |

### Done when

- [ ] Every criterion passes, checked by hand, and the tests and the build pass.
- [ ] Run the Vitest integration test against the dev server and observe it fail when the covered behavior is temporarily broken. Restore the behavior and verify the test passes.
- [ ] Record the output of `npm test`, `npm run build`, and `npm run lint`, and explain how to verify the ticket in the browser.
