import type { Dispatch, SetStateAction } from 'react';

import { MdDarkMode, MdLightMode } from 'react-icons/md';
import { cn } from '../utils/merge';

function DarkModeToggle({
    darkMode,
    setDarkMode,
}: { darkMode: boolean; setDarkMode: Dispatch<SetStateAction<boolean>> }) {
    return (
        <div className='flex flex-row-reverse'>
            <label className='inline-flex items-center cursor-pointer gap-x-1'>
                <MdDarkMode />
                <input
                    type='checkbox'
                    value=''
                    className='sr-only peer'
                    onChange={() => setDarkMode(!darkMode)}
                />
                <div
                    className={cn(
                        'relative w-9 h-5 bg-gray-200 rounded-full',
                        "after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all",
                        'dark:bg-gray-500 dark:border-gray-500',
                        'peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white peer-focus:outline-none peer-focus:ring-none peer peer-checked:bg-accentDark-500',
                    )}
                />
                <MdLightMode />
            </label>
        </div>
    );
}

export default DarkModeToggle;
