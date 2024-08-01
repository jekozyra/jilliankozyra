function Section({
    title,
    children,
}: { title: string; children: React.ReactNode | string }) {
    return (
        <div className='flex flex-col mb-6'>
            <div className='flex uppercase mb-1 text-accent-300 dark:text-accentDark-500'>
                {title}
            </div>
            <div className='flex ml-6 md:ml-8'>{children}</div>
        </div>
    );
}

export default Section;
