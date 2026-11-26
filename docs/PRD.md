# PRD: Maison Chatrier

## The product

Maison Chatrier is a fictional high-fashion boutique for shoppers discovering its clothing online. Stage 1 lets them browse an editorial collection, choose an available size, place a demo order, and follow its simulated progress. Use the mockups in `docs/design/` for visual direction and the requirements below for behavior and content.

## Users

| Who | What they can do |
| --- | --- |
| Visitor | Browse, search, filter and sort the collection, view a product, manage a shopping bag, and register or sign in. |
| Signed-in shopper | Do everything a visitor can do, place a demo order, view their own confirmation and order history, and sign out. |

## Pages

| URL | What it shows | Who can see it |
| --- | --- | --- |
| `/` | Maison Chatrier and an entry to the collection. | Everyone |
| `/collection` | Six pieces with category filtering, search, and sorting. | Everyone |
| `/products/[slug]` | Photos, price in SEK, fit description, size availability, and add to bag. | Everyone |
| `/bag` | Selected pieces and sizes, quantities, total, and a link to checkout. | Everyone |
| `/sign-up` | Email and password registration and the email confirmation prompt. | Everyone |
| `/sign-in` | Email and password sign-in. | Everyone |
| `/checkout` | Order review and Swedish delivery address form. | Signed-in shoppers |
| `/orders/[id]` | Confirmation with the order number, items, and total. | Shopper who placed the order |
| `/orders` | My orders, with the shopper's purchases and their current demo statuses. | Signed-in shoppers |

## User stories

### Catalog (C)

**C1. Discover the boutique**  
As a first-time visitor, I want an introduction to Maison Chatrier, so that I can discover the collection.

- [ ] Open the homepage and follow its collection link to the shop.

**C2. Browse the collection**  
As a shopper, I want to narrow and sort the collection, so that I can find garments in my preferred category and price range.

- [ ] Open the collection with no controls selected and see six garments in curated order across outerwear, tops, and trousers.
- [ ] Select a category and search for part of a garment name in mixed case. Only garments matching both controls appear.
- [ ] Sort matching garments by price low to high or high to low and see the corresponding order.
- [ ] Search for a name that does not match. An empty state appears and the search term and category selection remain visible.

**C3. Choose an available size**  
As a shopper, I want to see how a garment looks and fits and which sizes are available, so that I can choose a piece confidently.

- [ ] Open a garment and see photos, a fit description, one color, a price in SEK, and sizes XS–L.
- [ ] Open the launch garment with a sold-out size and verify that size is marked sold out and cannot be added.
- [ ] Select an available size and add it to the bag.

### Accounts (A)

**A1. Register and confirm an email**  
As a visitor, I want to register with my email and password, so that I can place demo orders.

- [ ] Register and see a prompt to check email. Confirm the address using the email link, then sign in with the registered credentials.
- [ ] Try to sign in before confirming the email and see a message to confirm it first.

**A2. Sign in and out**  
As a shopper, I want to sign in when I am ready to check out and sign out when I finish, so that I can use my account and keep my orders private.

- [ ] Open checkout while signed out, sign in, and return to checkout with the bag intact.
- [ ] Enter incorrect credentials and see a clear error.
- [ ] Sign out and open My orders. Sign-in is required.

### Orders (O)

**O1. Manage a shopping bag**  
As a shopper, I want to manage my bag before signing in, so that I can decide what to order.

- [ ] Add two available sizes of the same garment and see two separate lines.
- [ ] Change a quantity or remove a line and see the total update.
- [ ] Refresh or sign in using the same browser and see the same selections.

**O2. Place a demo order**  
As a signed-in shopper, I want to review my bag and enter a Swedish delivery address, so that I can place a demo order.

- [ ] See the current catalog prices and total in SEK. Enter a full name, street address, postcode, and city, then select **Place demo order**.
- [ ] Leave a required field blank and see which field needs attention.
- [ ] Place an order successfully and see the bag clear and the confirmation open. Availability for the purchased sizes decreases by the ordered quantities.
- [ ] Try to place an order for more units than are currently available. Checkout identifies the affected garment and size, leaves the bag intact, and creates no order.

**O3. View an order confirmation**  
As a shopper who placed an order, I want to see what I ordered, so that I can verify my purchase.

- [ ] Open the confirmation and see the order number, each garment's name, size, quantity and unit price at purchase, and the total in SEK.
- [ ] Open another shopper's order URL and receive a 404 response.

**O4. See order history and demo status**  
As a signed-in shopper, I want to see my past demo orders and their statuses, so that I can follow their simulated progress.

- [ ] Open My orders and see only your orders, newest first, with the order number, date, total in SEK, and status.
- [ ] Select an order and see its confirmation. A shopper with no orders sees an empty state.
- [ ] Open or refresh My orders and see the status for the elapsed time since the order was placed.

| Time since placement | Status |
| --- | --- |
| Under 1 hour | Order placed |
| 1 hour to under 3 hours | Processing |
| 3 hours to under 24 hours | Shipped |
| 24 hours or more | Delivered |

## The API

| Method | Route | Takes | Who may call it | Status codes |
| --- | --- | --- | --- | --- |
| POST | `/api/auth/sign-up` | Email, password, optional checkout return destination | Visitor | 202 accepted, 400 registration failed |
| GET | `/api/auth/confirm` | Supabase confirmation token and optional checkout return destination | Visitor with confirmation link | 303 redirect to sign-in, 400 invalid confirmation |
| POST | `/api/auth/sign-in` | Email, password, optional checkout return destination | Visitor | 200 signed in, 401 sign-in failed |
| POST | `/api/auth/sign-out` | Current session | Signed-in shopper | 204 signed out |
| POST | `/api/bag/quote` | Product-size IDs and quantities from the browser bag | Everyone | 200 bag lines with current prices and total |
| POST | `/api/orders` | Product-size IDs, quantities, full name, street address, postcode, and city | Signed-in shopper | 201 created with confirmation URL, 400 missing required field, 401 sign-in required, 409 insufficient stock with affected line |

## Touchpoints

| What | Who builds it | Who uses it | Agreement |
| --- | --- | --- | --- |
| Product size and availability | Catalog | Orders | Every garment and size combination has a stable ID. Orders uses it to look up the garment, SEK price, and stock. |
| Add to bag | Orders | Catalog | The product page passes the selected product-size ID and quantity to the browser bag. |
| Session and checkout return | Accounts | Orders | The server can identify the signed-in shopper. Sign-up, confirmation and sign-in preserve the checkout return destination when applicable. |
| Order placement and confirmation | Orders | Orders | Validate availability, save the order and its item snapshots, and decrement stock in one transaction. Confirmation and history use the signed-in shopper's identity. |

## Testing

- Run Vitest 3 integration tests against the dev server. Use the Route Handler when the story has one and fetch the page by URL for page behavior. Verify the response status and what the response or page shows. Check each ticket by hand in a browser as well, and demonstrate that its integration test fails when the covered behavior is broken.
- Check homepage navigation, combined category and name search, both price sorts, empty results, product details, and sold-out sizes.
- Check registration, unconfirmed and incorrect sign-in, checkout return, and sign-out. Use the browser for the email link and for bag persistence across refresh and sign-in.
- Check bag quotes, successful order placement, missing address fields, and insufficient stock with no partial order or stock changes. Check the confirmation snapshot and access to another shopper's order.
- Check that My orders shows only the signed-in shopper's orders in newest-first order, including the four status windows. Use orders with controlled placement times to test the thresholds without waiting.
- Load test configuration through Vite's `loadEnv`. Use the configured test customer for sign-in and isolate test-created records with `test-…` names. Remove only records created by the test in `afterAll`.

## Out of scope

Real payments and fulfillment, shipping fees and delivery options, order confirmation emails, password reset, profile editing, saved addresses, wishlists, and an admin panel.

## Open questions

None for stage 1. Catalog chooses the launch garments, prices, photos, fit descriptions, and starting stock.
