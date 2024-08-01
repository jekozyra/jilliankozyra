import type { Config } from "tailwindcss";

const indices = [
  "50",
  "100",
  "200",
  "300",
  "400",
  "500",
  "600",
  "700",
  "800",
  "900",
  "950",
];

const primary = indices.reduce<Record<string, string>>((accumulator, level) => {
  accumulator[level] = `rgb(var(--base-${level}) / <alpha-value>)`;
  accumulator[`${level}X`] = `rgb(var(--base-${level}X) / <alpha-value>)`;
  return accumulator;
}, {});

const accent = indices.reduce<Record<string, string>>((accumulator, level) => {
  accumulator[level] = `rgb(var(--accent-${level}) / <alpha-value>)`;
  accumulator[`${level}X`] = `rgb(var(--accent-${level}X) / <alpha-value>)`;
  return accumulator;
}, {});

const primaryDark = indices.reduce<Record<string, string>>(
  (accumulator, level) => {
    accumulator[level] = `rgb(var(--base-dark-${level}) / <alpha-value>)`;
    accumulator[
      `${level}X`
    ] = `rgb(var(--base-dark-${level}X) / <alpha-value>)`;
    return accumulator;
  },
  {}
);

const accentDark = indices.reduce<Record<string, string>>(
  (accumulator, level) => {
    accumulator[level] = `rgb(var(--accent-dark-${level}) / <alpha-value>)`;
    accumulator[
      `${level}X`
    ] = `rgb(var(--accent-dark-${level}X) / <alpha-value>)`;
    return accumulator;
  },
  {}
);

const config: Config = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      backgroundImage: {
        "gradient-radial": "radial-gradient(var(--tw-gradient-stops))",
        "gradient-conic":
          "conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))",
      },
      colors: {
        primary,
        accent,
        primaryDark,
        accentDark,
      },
    },
  },
  plugins: [],
};
export default config;
