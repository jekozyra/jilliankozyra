import type { Metadata } from 'next';
import { Martian_Mono, Hanken_Grotesk } from 'next/font/google';
import './globals.css';

const martianMono = Martian_Mono({
    subsets: ['latin'],
    display: 'swap',
    variable: '--font-martian-mono',
});

const hankenGrotesk = Hanken_Grotesk({
    subsets: ['latin'],
    display: 'swap',
    variable: '--font-hanken-grotesk',
});

export const metadata: Metadata = {
    title: 'Jillian Kozyra',
    description: 'jilliankozyra.com',
};

export default function RootLayout({
    children,
}: Readonly<{
    children: React.ReactNode;
}>) {
    return (
        <html lang='en'>
            <body
                className={`${martianMono.variable} ${hankenGrotesk.variable} overscroll-none`}
            >
                {children}
            </body>
        </html>
    );
}
