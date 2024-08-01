import DarkModeToggle from './DarkModeToggle';

function Header() {
    return (
        <div className='flex flex-col mb-6 gap-y-2'>
            <DarkModeToggle />
            <div className='flex flex-row justify-between'>
                <div className='flex uppercase'>Jillian(1)</div>
                <div className='flex'>jilliankozyra.com</div>
                <div className='flex uppercase'>Jillian(1)</div>
            </div>
        </div>
    );
}

export default Header;
