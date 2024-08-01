import Description from '../components/Description';
import Files from '../components/Files';
import History from '../components/History';

export const sections: { [key: string]: React.ReactNode } = {
    Name: 'Jillian Kozyra',
    Synopsis:
        'jillian [--software-engineer] [--engineering-leader] [--cyclist] [--climber]',
    Description: Description(),
    History: History(),
    Files: Files(),
};
