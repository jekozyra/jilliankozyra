import Description from '@/app/components/Description';
import Files from '@/app/components/Files';
import History from '@/app/components/History';

export const sections: { [key: string]: React.ReactNode } = {
    Name: 'Jillian Kozyra',
    Synopsis:
        'jillian [--software-engineer] [--engineering-leader] [--cyclist] [--climber]',
    Description: Description(),
    History: History(),
    Files: Files(),
};
