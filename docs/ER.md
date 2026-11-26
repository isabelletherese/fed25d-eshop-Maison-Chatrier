# ER diagram

```mermaid
erDiagram
    AUTH_USERS ||--o{ ORDERS : places
    PRODUCTS ||--|{ PRODUCT_SIZES : offers
    ORDERS ||--|{ ORDER_ITEMS : contains
    PRODUCT_SIZES ||--o{ ORDER_ITEMS : identifies

    AUTH_USERS {
        uuid id PK
        text email
    }

    PRODUCTS {
        uuid id PK
        text slug UK
        text name
        text category
        text color
        text fit_description
        text[] photo_paths
        integer price_ore
        integer collection_position
    }

    PRODUCT_SIZES {
        uuid id PK
        uuid product_id FK
        text size
        integer stock
    }

    ORDERS {
        uuid id PK
        uuid user_id FK
        timestamptz placed_at
        text full_name
        text street_address
        text postcode
        text city
    }

    ORDER_ITEMS {
        uuid order_id PK, FK
        uuid product_size_id PK, FK
        text product_name
        text size
        integer unit_price_ore
        integer quantity
    }
```

- `AUTH_USERS` shows the referenced fields of Supabase Auth's managed `auth.users` table.
- Product category is outerwear, tops, or trousers. Each product has at least one photo.
- Collection position is unique and determines the default display order.
- Product ID and size are unique together. Size is XS, S, M, or L, and stock is zero or greater.
- Prices are stored as integer öre and are zero or greater. Order item quantity is greater than zero.
- The order ID serves as the order number. Order totals are calculated from saved line quantities and unit prices.
- Status is calculated from the order's placement time when My orders is loaded.
- Removing a user cascades to their orders. Removing an order cascades to its items.
- Removing a product cascades to its sizes. A size referenced by an order item cannot be deleted.
- App tables have row-level security enabled with no browser policies. The shopping bag is stored in the browser.
