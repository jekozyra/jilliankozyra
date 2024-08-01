import Link from '../Link';

function SoftwareEngineer() {
    return (
        <div className='flex flex-col gap-2'>
            <div>
                I&apos;ve worked at a variety of companies from seed series
                startups to FAANGs. While I enjoy contributing anywhere in the
                stack, my deepest experience is in the backend. I&apos;ve built
                many APIs and pipelines, lately with a focus on RAG to enable
                agentic LLMs.
            </div>
            <div>
                I do not have a strong language preference and prefer to use the
                right tools for the problem at hand. I&apos;ve worked in Ruby,
                Typescript, Node.js, Python, and Haskell, with frameworks
                including Flask, FastAPI, GraphQL, React, Ruby on Rails,
                Tailwind CSS, Next.js, Airflow, and Prefect, across GCP and AWS.
                I also love optimising Postgres performance.
            </div>
            <div>
                I am always open to consulting projects. Feel free to reach out
                at{' '}
                <Link href='mailto:jilliankozyra@gmail.com' target='_blank'>
                    jilliankozyra AT gmail.com
                </Link>
            </div>
        </div>
    );
}

export default SoftwareEngineer;
