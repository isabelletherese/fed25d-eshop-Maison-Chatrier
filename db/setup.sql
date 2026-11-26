begin;

create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  name text not null,
  category text not null check (category in ('outerwear', 'tops', 'trousers')),
  color text not null,
  fit_description text not null,
  photo_paths text[] not null check (cardinality(photo_paths) > 0),
  price_ore integer not null check (price_ore >= 0),
  collection_position integer not null unique
);

create table if not exists public.product_sizes (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products (id) on delete cascade,
  size text not null check (size in ('XS', 'S', 'M', 'L')),
  stock integer not null check (stock >= 0),
  unique (product_id, size)
);

create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  placed_at timestamptz not null default now(),
  full_name text not null,
  street_address text not null,
  postcode text not null,
  city text not null
);

create table if not exists public.order_items (
  order_id uuid not null references public.orders (id) on delete cascade,
  product_size_id uuid not null references public.product_sizes (id) on delete restrict,
  product_name text not null,
  size text not null,
  unit_price_ore integer not null check (unit_price_ore >= 0),
  quantity integer not null check (quantity > 0),
  primary key (order_id, product_size_id)
);

alter table public.products enable row level security;
alter table public.product_sizes enable row level security;
alter table public.orders enable row level security;
alter table public.order_items enable row level security;

insert into public.products
  (slug, name, category, color, fit_description, photo_paths, price_ore, collection_position)
values
  ('sculpted-coat', 'The sculpted coat', 'outerwear', 'Black',
   'A belted wool coat with a defined shoulder and a calf-length hem.',
   array['/catalog/coat.jpg'], 1850000, 1),
  ('cashmere-shell', 'The cashmere shell', 'tops', 'Ivory',
   'A sleeveless knit with a high crew neck and a relaxed fit.',
   array['/catalog/shell.jpg'], 420000, 2),
  ('tailored-trouser', 'The tailored trouser', 'trousers', 'Charcoal',
   'A high-waisted wool trouser with a long, straight leg.',
   array['/catalog/trouser.jpg'], 580000, 3),
  ('belted-wrap-coat', 'The belted wrap coat', 'outerwear', 'Black',
   'A wrap-front coat with an adjustable waist and room to layer.',
   array['/catalog/coat.jpg'], 1490000, 4),
  ('ribbed-shell', 'The ribbed shell', 'tops', 'Ivory',
   'A close-fitting sleeveless knit with a clean neckline.',
   array['/catalog/shell.jpg'], 320000, 5),
  ('pleated-trouser', 'The pleated trouser', 'trousers', 'Charcoal',
   'Front pleats add room through the hip and fall into a wide leg.',
   array['/catalog/trouser.jpg'], 490000, 6)
on conflict (slug) do nothing;

insert into public.product_sizes (product_id, size, stock)
select products.id, sizes.size,
  case when products.slug = 'sculpted-coat' and sizes.size = 'XS' then 0 else 5 end
from public.products
cross join (values ('XS'), ('S'), ('M'), ('L')) as sizes(size)
where products.slug in (
  'sculpted-coat', 'cashmere-shell', 'tailored-trouser',
  'belted-wrap-coat', 'ribbed-shell', 'pleated-trouser'
)
on conflict (product_id, size) do nothing;

commit;
