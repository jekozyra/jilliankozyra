import Link from '../Link';

function Climber() {
    return (
        <div className='flex flex-col gap-2'>
            <div>
                I boulder 2-3 times a week (3-4 in the cycling offseason),
                usually at{' '}
                <Link
                    href='https://touchstoneclimbing.com/dogpatch-boulders/'
                    target='_blank'
                >
                    Dogpatch Boulders
                </Link>{' '}
                in San Francisco. My favourite NYC-area gym is{' '}
                <Link href='https://methodclimb.com/newarknj/' target='_blank'>
                    Method
                </Link>{' '}
                in Newark, NJ. They have some of the best setting I&apos;ve ever
                experienced (if you like more modern setting styles). I like to
                visit local gyms when I travel to check out the different syles
                of problems.
            </div>
            <div>I am working towards projecting V9.</div>
        </div>
    );
}

export default Climber;
