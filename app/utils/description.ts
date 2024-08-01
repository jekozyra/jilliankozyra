import Cyclist from '../components/descriptions/Cyclist';
import SoftwareEngineer from '../components/descriptions/SoftwareEngineer';
import EngLeader from '../components/descriptions/EngLeader';
import Climber from '../components/descriptions/Climber';

export type DescriptionEntry = {
    flag: string;
    details: React.ReactNode;
};

type DescriptionEntries = DescriptionEntry[];

export const descriptionItems: DescriptionEntries = [
    {
        flag: '--software-engineer',
        details: SoftwareEngineer(),
    },
    {
        flag: '--engineering-leader',
        details: EngLeader(),
    },
    {
        flag: '--cyclist',
        details: Cyclist(),
    },
    {
        flag: '--climber',
        details: Climber(),
    },
];
