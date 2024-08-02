import type { Dispatch, SetStateAction } from 'react';
import DarkModeToggle from './DarkModeToggle';

function Header({
    darkMode,
    setDarkMode,
}: { darkMode: boolean; setDarkMode: Dispatch<SetStateAction<boolean>> }) {
    return (
        <div className='flex flex-col mb-6 gap-y-2'>
            <DarkModeToggle darkMode={darkMode} setDarkMode={setDarkMode} />
            <div className='flex flex-row justify-between'>
                <div className='flex uppercase'>Jillian(1)</div>
                <div className='flex'>jilliankozyra.com</div>
                <div className='hidden uppercase sm:flex'>Jillian(1)</div>
            </div>
        </div>
    );
}

export default Header;
