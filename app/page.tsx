'use client';

import { useState } from 'react';
import Header from './components/Header';
import Section from './components/Section';
import { sections } from './utils/sections';
import { cn } from '@/lib/merge';

export default function Home() {
    const cachedDarkMode = localStorage.getItem('darkMode');
    const [darkMode, setDarkMode] = useState(
        cachedDarkMode ? JSON.parse(cachedDarkMode) : true,
    );

    return (
        <main
            className={cn(
                'flex w-full h-full min-h-screen flex-col items-center justify-between font-mono p-4 text-sm',
                'text-primary-600 bg-gradient-to-b from-backgroundLightStart to-backgroundLightEnd',
                darkMode ? 'dark' : '',
                'dark:text-primaryDark-800 dark:bg-gradient-to-b dark:from-backgroundDarkStart dark:to-backgroundDarkEnd',
            )}
        >
            <div className='lg:w-3/5 w-full'>
                <Header darkMode={darkMode} setDarkMode={setDarkMode} />
                {Object.entries(sections).map(([title, content]) => {
                    return (
                        <Section key={title} title={title}>
                            {content}
                        </Section>
                    );
                })}
            </div>
        </main>
    );
}
