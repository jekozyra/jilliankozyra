import NextLink, { type LinkProps as NextLinkProps } from 'next/link';
import { forwardRef, type ReactNode } from 'react';
import { cn } from '@/lib/merge';

interface LinkProps extends NextLinkProps {
    children: ReactNode;
    target?: string;
    className?: string;
}

const Link = forwardRef<HTMLAnchorElement, LinkProps>(
    ({ children, className, target = '_blank', ...props }, ref) => {
        return (
            <NextLink
                ref={ref}
                target={target}
                {...props}
                className={cn(
                    'text-green-light dark:text-yellow-dark hover:opacity-90',
                    className,
                )}
            >
                {children}
            </NextLink>
        );
    },
);
Link.displayName = 'Link';

export default Link;
