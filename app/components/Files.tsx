import Link from './Link';
import { FaLinkedin, FaTwitter } from 'react-icons/fa';
import { MdMenuBook } from 'react-icons/md';

function Files() {
    return (
        <div className='flex flex-col gap-y-1'>
            <Link
                href='https://x.com/JillianKozyra'
                className='flex flex-row gap-x-2 items-center'
            >
                <FaLinkedin className='w-5 min-w-5' />
                LinkedIn
            </Link>
            <Link
                href='https://x.com/JillianKozyra'
                className='flex flex-row gap-x-2 items-center'
            >
                <FaTwitter className='w-5 min-w-5' />
                Twitter
            </Link>
            <Link
                href='/JKozyra_complete.pdf'
                className='flex flex-row gap-x-2 items-center'
            >
                <MdMenuBook className='w-5 min-w-5' />
                As the Post-Soviet World Turns: Coalition Politics in
                Ukraine&apos;s Verkhovna Rada
            </Link>
        </div>
    );
}

export default Files;
