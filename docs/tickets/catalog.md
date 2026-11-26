## 02: Introduce the boutique

**Owner:** Catalog   **User stories:** C1   **Blocked by:** 01

### What to build

Give visitors a Maison Chatrier homepage with a clear path to the collection. Verify the link destination in this ticket and check the live collection once 03 lands.

### Acceptance criteria

- [ ] Open the homepage and follow its collection link to the shop.

### Done when

- [ ] Every criterion passes, checked by hand, and the tests and the build pass.
- [ ] Run the Vitest integration test against the dev server and observe it fail when the covered behavior is temporarily broken. Restore the behavior and verify the test passes.
- [ ] Record the output of `npm test`, `npm run build`, and `npm run lint`, and explain how to verify the ticket in the browser.

## 03: Browse the collection

**Owner:** Catalog   **User stories:** C2   **Blocked by:** 01

### What to build

Let shoppers browse the launch garments and combine category, name search, and price sorting on the collection page.

### Acceptance criteria

- [ ] Open the collection with no controls selected and see six garments in curated order across outerwear, tops, and trousers.
- [ ] Select a category and search for part of a garment name in mixed case. Only garments matching both controls appear.
- [ ] Sort matching garments by price low to high or high to low and see the corresponding order.
- [ ] Search for a name that does not match. An empty state appears and the search term and category selection remain visible.

### Done when

- [ ] Every criterion passes, checked by hand, and the tests and the build pass.
- [ ] Run the Vitest integration test against the dev server and observe it fail when the covered behavior is temporarily broken. Restore the behavior and verify the test passes.
- [ ] Record the output of `npm test`, `npm run build`, and `npm run lint`, and explain how to verify the ticket in the browser.

## 07: Choose a size and add it to the bag

**Owner:** Catalog   **User stories:** C3   **Blocked by:** 06

### What to build

Show garment photos, fit, price, and size availability. Pass the chosen available product-size ID and quantity to the shopping bag.

### Acceptance criteria

- [ ] Open a garment and see photos, a fit description, one color, a price in SEK, and sizes XS–L.
- [ ] Open the launch garment with a sold-out size and verify that size is marked sold out and cannot be added.
- [ ] Select an available size and add it to the bag.

### Done when

- [ ] Every criterion passes, checked by hand, and the tests and the build pass.
- [ ] Run the Vitest integration test against the dev server and observe it fail when the covered behavior is temporarily broken. Restore the behavior and verify the test passes.
- [ ] Record the output of `npm test`, `npm run build`, and `npm run lint`, and explain how to verify the ticket in the browser.
