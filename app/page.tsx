import Header from './components/Header';
import Section from './components/Section';
import { sections } from './utils/sections';

export default function Home() {
    return (
        <main className='flex w-full min-h-screen flex-col items-center justify-between font-mono p-4 text-sm'>
            <div className='lg:w-3/5 w-full'>
                <Header />
                {Object.entries(sections).map(([title, content]) => {
                    return (
                        <Section key={title} title={title}>
                            {content}
                        </Section>
                    );
                })}
            </div>
        </main>
    );
}
