import { type ClassValue, clsx } from 'clsx';
import { extendTailwindMerge } from 'tailwind-merge';

const customTwMerge = extendTailwindMerge({
    override: {
        classGroups: {
            'font-size': [
                {
                    text: [
                        'base',
                        'h1',
                        'h2',
                        'h3',
                        'label',
                        'xxs',
                        'xs',
                        'sm',
                        'lg',
                        'xl',
                    ],
                },
            ],
        },
    },
} as any);

export function cn(...inputs: ClassValue[]) {
    return customTwMerge(clsx(inputs));
}
