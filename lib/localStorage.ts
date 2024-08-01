export const getItem = (key: string): string | null => {
    try {
        return localStorage.getItem(key);
    } catch (error) {
        // biome-ignore lint/nursery/noConsole: error
        console.error(error);
        return null;
    }
};

export const setItem = (key: string, value: string): void => {
    try {
        localStorage.setItem(key, value);
    } catch (error) {
        // biome-ignore lint/nursery/noConsole: error
        console.error(error);
    }
};

export const removeItem = (key: string): void => {
    try {
        localStorage.removeItem(key);
    } catch (error) {
        // biome-ignore lint/nursery/noConsole: error
        console.error(error);
    }
};
