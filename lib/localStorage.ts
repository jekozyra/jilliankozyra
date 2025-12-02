export const getItem = (key: string): string | null => {
    if (typeof window === 'undefined') {
        return null;
    }
    try {
        return localStorage.getItem(key);
    } catch (error) {
        // biome-ignore lint/nursery/noConsole: error
        console.error(error);
        return null;
    }
};

export const setItem = (key: string, value: string): void => {
    if (typeof window === 'undefined') {
        return;
    }
    try {
        localStorage.setItem(key, value);
    } catch (error) {
        // biome-ignore lint/nursery/noConsole: error
        console.error(error);
    }
};

export const removeItem = (key: string): void => {
    if (typeof window === 'undefined') {
        return;
    }
    try {
        localStorage.removeItem(key);
    } catch (error) {
        // biome-ignore lint/nursery/noConsole: error
        console.error(error);
    }
};
