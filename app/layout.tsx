import type { Metadata } from "next";
import Link from "next/link";
import "./globals.css";

export const metadata: Metadata = {
  title: "Maison Chatrier",
  description: "The Maison Chatrier fashion boutique.",
};

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html lang="en" className="h-full antialiased">
      <body className="flex min-h-full flex-col">
        <header className="border-b border-stone-200">
          <p className="bg-[#272722] px-4 py-2 text-center text-[0.65rem] uppercase tracking-wide text-white">
            Complimentary shipping &amp; signature packaging on every order
          </p>
          <div className="grid items-center gap-3 px-5 pt-4 text-xs sm:grid-cols-3 sm:px-12">
            <span className="hidden sm:block">Sweden / SEK</span>
            <Link href="/" className="text-center font-serif text-3xl">
              Maison Chatrier
            </Link>
            <div className="flex justify-center gap-6 sm:justify-end">
              <Link href="/sign-in" className="hover:underline">Account</Link>
              <Link href="/bag" className="hover:underline">Bag</Link>
            </div>
          </div>
          <nav aria-label="Storefront" className="py-3 text-center text-xs uppercase tracking-wide">
            <Link href="/collection" className="hover:underline">Collection</Link>
          </nav>
        </header>
        {children}
        <footer className="mt-auto bg-[#ebe9e1] px-5 py-10 sm:px-12">
          <Link href="/" className="font-serif text-2xl uppercase">
            Maison Chatrier
          </Link>
          <p className="mt-6 border-t border-stone-300 pt-4 text-xs">
            © 2026 Maison Chatrier
          </p>
        </footer>
      </body>
    </html>
  );
}
