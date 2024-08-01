export type ResumeEntry = {
    startDate: string;
    endDate: string;
    title: string;
    company: string;
    responsibilities: string[];
};

type ResumeEntries = ResumeEntry[];

export const resume: ResumeEntries = [
    {
        title: 'Staff Software Engineer',
        startDate: '2021',
        endDate: 'Present',
        company: 'Poggio Labs',
        responsibilities: [
            'Member of founding engineering team',
            'Hired and led platform engineering team',
            'Designed and built platform to ingest data at scale and surface it in app',
            'Built RAG pipeline to harvest and automatically summarise documents',
            'Worked on ways to standardise prompt iteration for non-technical team members',
        ],
    },
    {
        title: 'Staff Software Engineer',
        startDate: '2021',
        endDate: '2021',
        company: 'Curative',
        responsibilities: [
            'Member of founding engineering team',
            'Built out lab + patient management apps to scale from 0 to 200k COVID tests/day',
            'Scaled up vaccine portal in response to viral demand',
            'Interfaced with cusomters to build and support data synchronisation',
            'Built technical support eng team to handle complex customer success requests',
        ],
    },
    {
        title: 'Staff Software Engineer',
        startDate: '2019',
        endDate: '2020',
        company: 'Atrium LTS',
        responsibilities: [
            'Developed document ingestion and classification pipeline for legal docs',
            'Built out ETL pipelines to enable data-driven decisions for BI team',
            'Rolled out Sorbet, static typechecking for Ruby, throughout legacy Rails codebase',
            'Mentored junior engineers on backend skills',
        ],
    },
    {
        title: 'Senior Software Engineer',
        startDate: '2017',
        endDate: '2019',
        company: 'Facebook',
        responsibilities: [
            'Worked on software to proactively flag platform abuse on Facebook and Instagram',
            'Contributed to modern and legacy software used by content reviewers (SRT, CRT)',
            'Led a team of 5 engineers',
            'Devised and implemented strategies to reduce amount of manual content review',
            'Upleveled engineering team by standardising practises such as RCA reviews',
            'Was #1 Haskell contributor at Facebook for several quarters',
        ],
    },
    {
        title: 'Data Scientist',
        startDate: '2014',
        endDate: '2017',
        company: 'Google',
        responsibilities: [
            'Devised and implemented strategies to prevent spam from appearing in search',
            'Sole maintainer of codebase for webmasters to have search penalties revoked',
            'Analysed large amounts of data to detect new spammy behaviours',
            'Created processes/pipelines for team with emphasis on scale and automation',
            'Led Python class at Google to teach non-engineers how to code',
        ],
    },
    {
        title: 'CTO/Co-founder',
        startDate: '2012',
        endDate: '2018',
        company: 'Stablerenters/RentSpecs',
        responsibilities: [
            'Built app to rate landlords and rental properties in New York City',
            'Used heuristics and publicly available datasets to generate rankings',
        ],
    },
    {
        title: 'Researcher/Teaching Assistant',
        startDate: '2008',
        endDate: '2011',
        company: 'Courant Institute (NYU)',
        responsibilities: [
            'Built app for linguistics department for analysing linguistic traits across languages',
            'Aided students in CS (Java and Python) classes with homework and coursework',
        ],
    },
    {
        title: 'MA, Central & Eastern European Studies',
        startDate: '2010',
        endDate: '2012',
        company: 'Uniwersytet Jagielloński',
        responsibilities: [
            'GPA: 4.8/5.0',
            'Dissertation: 5.0/5.0',
            "Topic:Coalition Politics in Ukraine's Verkhovna Rada from 2006-Present",
        ],
    },
    {
        title: 'BA, Computer Science & Russian',
        startDate: '2005',
        endDate: '2010',
        company: 'NYU',
        responsibilities: [
            'Slavic Award for Excellence, for achievement in Slavic languages/literature',
            "Dean's List, 2007-2010",
        ],
    },
];
