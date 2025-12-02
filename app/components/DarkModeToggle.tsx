import type { Dispatch, SetStateAction } from 'react';

import { MdDarkMode, MdLightMode } from 'react-icons/md';
import { cn } from '@/lib/merge';
import { setItem } from '@/lib/localStorage';
import { LOCAL_STORAGE_KEY_DARK_MODE } from '@/lib/constants';

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
                    checked={!darkMode}
                    className='sr-only peer'
                    onChange={() => {
                        const newVal = !darkMode;
                        setDarkMode(newVal);
                        setItem(LOCAL_STORAGE_KEY_DARK_MODE, `${newVal}`);
                    }}
                />
                <div
                    className={cn(
                        'relative w-9 h-5 bg-gray-200 rounded-full',
                        "after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all",
                        'dark:bg-gray-500 dark:border-gray-500',
                        'peer-checked:after:translate-x-full peer-checked:rtl:after:-translate-x-full peer-checked:after:border-white peer-focus:outline-hidden peer-focus:ring-none peer peer-checked:bg-accent-dark-500',
                    )}
                />
                <MdLightMode />
            </label>
        </div>
    );
}

export default DarkModeToggle;
