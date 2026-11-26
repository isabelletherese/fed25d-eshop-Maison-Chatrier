import Link from "next/link";

export default function Home() {
  return (
    <main className="grid flex-1 place-items-center px-5 py-24 text-center">
      <div>
        <h1 className="font-serif text-5xl sm:text-7xl">Maison Chatrier</h1>
        <Link
          href="/collection"
          className="mt-8 inline-block bg-[#272722] px-7 py-4 text-xs uppercase tracking-wide text-white hover:bg-stone-700"
        >
          Explore the collection
        </Link>
      </div>
    </main>
  );
}
