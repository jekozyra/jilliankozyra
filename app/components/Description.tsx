import { type DescriptionEntry, descriptionItems } from '../utils/description';

function DescriptionItem({ item }: { item: DescriptionEntry }) {
    return (
        <div className='flex flex-col sm:flex-row gap-x-2 gap-y-1'>
            <div className='flex min-w-52 w-52'>{item.flag}</div>
            <div className='flex'>{item.details}</div>
        </div>
    );
}

function Description(): React.ReactElement {
    return (
        <div className='flex flex-col gap-y-4'>
            <div className='flex'>
                I am a software engineer living and working in San Francisco. I
                enjoy building products that solve real-world problems with
                data. I grew up in NYC/NJ, went to grad school in Poland, then
                lived and worked in Ireland for 10 years before moving to SF.
            </div>
            <div className='flex flex-col gap-y-5'>
                {descriptionItems.map((item) => (
                    <DescriptionItem key={item.flag} item={item} />
                ))}
            </div>
        </div>
    );
}

export default Description;
