import Link from '@/app/components/Link';

function Cyclist() {
    return (
        <div>
            I enjoy racing, riding, and wrenching on bikes of all kinds,
            especially wheelbuilding and helping people build their dream bikes.
            I race for and help lead a Bay Area co-ed amateur team,{' '}
            <Link
                href='https://docs.google.com/presentation/d/1O6CztbCGAg2BsF9MZimDUEVS6P_zAPbMuD-k8VHrVFs/edit?usp=sharing'
                target='_blank'
            >
                Super Sprinkles
            </Link>
            . We emphasise increasing participation in racing for
            underrepresented groups.
        </div>
    );
}

export default Cyclist;
