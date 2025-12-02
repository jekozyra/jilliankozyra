'use client';

import { useState, useEffect } from 'react';
import Header from './components/Header';
import Section from './components/Section';
import { sections } from './utils/sections';
import { cn } from '@/lib/merge';
import { getItem } from '@/lib/localStorage';
import { LOCAL_STORAGE_KEY_DARK_MODE } from '@/lib/constants';

export default function Home() {
    const [darkMode, setDarkMode] = useState(true);

    useEffect(() => {
        const cachedDarkMode = getItem(LOCAL_STORAGE_KEY_DARK_MODE);
        if (cachedDarkMode) {
            setDarkMode(JSON.parse(cachedDarkMode));
        }
    }, []);

    return (
        <main
            className={cn(
                'flex w-full h-full min-h-screen flex-col items-center justify-between font-mono p-4 text-sm',
                'text-primary-600 bg-linear-to-b from-background-light-start to-background-light-end',
                darkMode ? 'dark' : '',
                'dark:text-primary-dark-800 dark:bg-linear-to-b dark:from-background-dark-start dark:to-background-dark-end',
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
