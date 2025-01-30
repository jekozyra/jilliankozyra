import Link from '@/app/components/Link';

function Cyclist() {
    return (
        <div className='flex flex-col gap-2'>
            <div>
                I enjoy racing, riding, and wrenching on bikes of all kinds,
                especially wheelbuilding and helping people build their dream
                bikes. I race for the largest amateur cycling team in northern
                California,{' '}
                <Link
                    href='https://docs.google.com/presentation/d/1O6CztbCGAg2BsF9MZimDUEVS6P_zAPbMuD-k8VHrVFs/edit?usp=sharing'
                    target='_blank'
                >
                    Super Sprinkles
                </Link>
                . We emphasise increasing participation in racing for
                underrepresented groups. I also serve as secretary of the board.
            </div>
            <div>
                In addition to my involvement with my team, I am also secretary
                of the board of the NCNCA, the northern California branch of USA
                Cycling. We work to set the race calendar for the region, help
                promoters produce high quality events, boost turnout, etc.
            </div>
        </div>
    );
}

export default Cyclist;
