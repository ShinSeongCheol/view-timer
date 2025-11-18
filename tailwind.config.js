/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        './app/**/*.{tsx,ts}',
        './pages/**/*.{tsx,ts}',
        './widgets/**/*.{tsx,ts}',
        './features/**/*.{tsx,ts}',
        './entities/**/*.{tsx,ts}',
        './shared/**/*.{tsx,ts}'
    ],
    presets: [require('nativewind/preset')],
    theme: {
        extend: {},
    },
    plugins: [],
}

