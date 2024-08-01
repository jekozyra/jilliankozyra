import { MdEmergency, MdOutlineHorizontalRule } from 'react-icons/md';
import { resume, type ResumeEntry } from '@/app/utils/resume';

function Asterisk() {
    return (
        <div className='w-4 min-w-4 pt-1'>
            <MdEmergency className='text-xs text-accent-300 dark:text-accent-500' />
        </div>
    );
}

function Dash() {
    return (
        <div className='min-w-4 w-4 pt-1'>
            <MdOutlineHorizontalRule className='text-xs text-accent-300 dark:text-accent-500' />
        </div>
    );
}

function Responsibility({ content }: { content: string }) {
    return (
        <div className='flex items-start ml-6'>
            <Dash />
            <div>{content}</div>
        </div>
    );
}

function HistoryRow({ resumeEntry }: { resumeEntry: ResumeEntry }) {
    return (
        <div className='flex flex-col gap-1'>
            <div className='flex flex-row gap-2 align-middle items-start'>
                <Asterisk />
                <div>{`${resumeEntry.company}, ${resumeEntry.title}, ${resumeEntry.startDate} - ${resumeEntry.endDate}`}</div>
            </div>
            {resumeEntry.responsibilities.map((responsibility, index) => (
                <Responsibility
                    key={`resp_${index}`}
                    content={responsibility}
                />
            ))}
        </div>
    );
}

function History() {
    return (
        <div className='flex flex-col gap-y-3'>
            {resume.map((entry) => (
                <HistoryRow key={entry.company} resumeEntry={entry} />
            ))}
        </div>
    );
}

export default History;
